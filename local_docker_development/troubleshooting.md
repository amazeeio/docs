# Troubleshooting local development environments

<!-- toc -->

## Generic Issues

For most problems with the Docker Development environment, it's the best to restart all shared and Drupal specific Docker containers.

### Restart shared Docker containers

This is done either in `pygmy` or `cachalot`

    cachalot restart
or

    pygmy restart -d

now you should also restart the Drupal specific Containers:

### Restart Drupal Containers

needs to be done separate for each Drupal container. Run this command where the `docker-compose.yml` is:

    docker-compose restart

sometimes this is not enough, we can tell docker compose to recreate the containers:

    docker-compose up -d --force-recreate

If this still is not enough, this is the 🔨  method:

    docker-compose down -v
    docker-compose up

{% hint style='danger' %}
This will remove your whole local MySQL database and maybe existing other local created volumes (like the solr search index).
{% endhint %}

### Drupal Container logs

The above commands all assume that something is wrong with the containers, sometimes though the issue lies somewhere else.
To find such issues, we need to analyze the docker logs, do that via:


    docker-compose logs
    Attaching to amazee_io.docker.amazee.io
    amazee_io.docker.amazee.io | *** Running /etc/my_init.d/00_regen_ssh_host_keys.sh...
    amazee_io.docker.amazee.io | *** Running /etc/my_init.d/20_virtual_host_replace.sh...
    amazee_io.docker.amazee.io | *** Running /etc/rc.local...
    amazee_io.docker.amazee.io | *** Booting runit daemon...
    amazee_io.docker.amazee.io | *** Runit started as PID 33
    amazee_io.docker.amazee.io | tail: cannot open ‘/var/log/nginx/10fe-drupal.error.log’ for reading: No such file or directory
    amazee_io.docker.amazee.io | tail: cannot open ‘/var/log/nginx/20be-drupal.error.log’ for reading: No such file or directory
    amazee_io.docker.amazee.io | tail: cannot open ‘/var/log/nginx/error.log’ for reading: No such file or directory
    amazee_io.docker.amazee.io | tail: cannot open ‘/var/log/nginx/ssl-10fe-drupal.error.log’ for reading: No such file or directory
    amazee_io.docker.amazee.io | 160502 05:13:44 mysqld_safe Logging to syslog.
    amazee_io.docker.amazee.io | child (246) Started
    amazee_io.docker.amazee.io | Child (246) said Child starts

Check the latest few lines of code and you probably see the issue.
Stuck here? Join our Slack at [slack.amazee.io](https://slack.amazee.io) and we help you.

### Shared container logs

To see the logs of the shared container started via `pygmy` or `cachalot`, first display all docker containers:

    docker ps

    CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS              PORTS                                      NAMES
    9e27b9eadc67        amazeeio/drupal:php70-basic   "/sbin/my_init"          5 minutes ago       Up 5 minutes        80/tcp, 443/tcp, 0.0.0.0:32782->3306/tcp   amazee_io.docker.amazee.io
    5ce655cd369f        andyshinn/dnsmasq:2.75        "dnsmasq -k -A /docke"   24 minutes ago      Up 24 minutes       0.0.0.0:53->53/tcp, 0.0.0.0:53->53/udp     amazeeio-dnsmasq
    124b3919e89a        amazeeio/ssh-agent            "/run.sh ssh-agent"      24 minutes ago      Up 24 minutes                                                  amazeeio-ssh-agent
    93eb7a384640        amazeeio/haproxy              "/app/docker-entrypoi"   24 minutes ago      Up 24 minutes       0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   amazeeio-haproxy

You can see three containers that have names with starting `amazeeio-` these are the shared containers.

You can view each container's logs via:

    docker logs -f [container name]

Btw, you can also see the logs of the Drupal Containers, via that command.

### I get an error like `Permission denied (publickey).` and I only see an alias for `@none` in `drush sa`

First try restarting your container, it may have lost the volume mount to the ssh-agent

```
docker-compose up --force -d
```

If that does not resolve the issue, restart pygmy/cachalot

```
cachalot restart
```

or

```
pygmy restart -d
```

### I get an error like `Conflict. The name "/amazee_io.docker.amazee.io" is already in use by container`

It happened to all of us, you remove a local `docker-compose.yml` file, recreate it and now during `docker-compose up -d`, docker yells at you and tells you this container exists already.

The easiest way would be to just give your new container another name, but there are better ways:

#### Remove a container

1. Find the name of the container you would like to completely remove via:

        docker ps

        CONTAINER ID        IMAGE                         COMMAND                  CREATED             STATUS              PORTS                                      NAMES
        9e27b9eadc67        amazeeio/drupal:php70-basic   "/sbin/my_init"          10 minutes ago      Up 10 minutes       80/tcp, 443/tcp, 0.0.0.0:32782->3306/tcp   amazee_io.docker.amazee.io

2. Stop the container

        docker stop amazee_io.docker.amazee.io

3. Remove the container with it's volumes:

        docker rm -v amazee_io.docker.amazee.io

#### Remove all containers and all volumes

You shouldn't really need to do this, and if you think so, first try the above help. But sometimes the best way is to completely restart:

    docker rm -vf $(docker ps -q -a)

This will stop and remove **all** containers and **all** attached volumes.

{% hint style='danger' %}
This will remove your whole local MySQL database and maybe existing other local created volumes (like the solr search index).
{% endhint %}


If you get an error like `cannot create temp file for here-document: No space left on device` then you can free up space by removing old volumes and images that we don't need anymore:

    docker volume rm $(docker volume ls -q)

If you also want to get rid of all the docker images you can run:

    docker rmi $(docker images -q)


Now you have a completely empty Docker, now it's time to start again with `pygmy` or `cachalot`.

### No space left on device

If you need to free up some disk space, you can do this:
  - start all containers that you need to preserve
  - run the following commands
    ```
    docker system prune
    docker image prune -a
    docker volume prune
    ```

### I get an error like `port is already allocated.` during start

If during the start of Docker containers you see an error like that:

    docker: Error response from daemon: driver failed programming external connectivity on endpoint
    amazeeio-haproxy (654d1f1c17b0f7304570a763e1017808b214b81648045a5c64ed6a395daeec92):
    Bind for 0.0.0.0:443 failed: port is already allocated.

This means that another service (can be another Docker container, or in case of Linux based systems another service like an installed nginx) is already using this Port.

You should stop this service or Docker container first.

### I get an error like `Service "drupal" mounts volumes from "amazeeio-ssh-agent", which is not the name of a service or container.`

This can happen when you start a Drupal Container via `docker-compose up -d` and the cachalot or pygmy service has stopped

    docker-compose up -d
    ERROR: Service "drupal" mounts volumes from "amazeeio-ssh-agent", which is not the name of a service or container.

The Drupal Containers are depending on the `ssh-agent` shared Docker container (this is in order to have shared ssh-keys) and somehow this container is missing.

Try to restart either `pygmy` or `cachalot`, this will create the `ssh-agent` container with the name `amazeeio-ssh-agent` and then try again.

### Working Offline

Amazeeio uses a remote DNS server to resolve your `*.docker.amazee.io` addresses which means if you don't have an internet connection you are not going to be able to get to your site. However, you can use your `hosts` file in this scenario. This file is typically located at `/etc/hosts` on Linux and macOS and `C:\Windows\System32\Drivers\etc\host` on Windows. You will need administrative privileges to edit this file.

If you are unfamiliar with this process, follow this tutorial at [How-To Geek](http://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/).

If you're using cachalot you are going to want to point your site to the value returned by `cachalot ip` (typically 192.168.99.100), while on pygmy you will want to use 127.0.0.1. Here are some examples:

### Host entry if using cachalot

```bash
192.168.99.100 awesomesauce.docker.amazee.io
```

### Host entry if using pygmy

```bash
127.0.0.1 awesomesauce.docker.amazee.io
```

## cachalot

### I don't see any files inside my Drupal Docker container

Currently only files that are inside of your home folder (something like `/User/yourname` are shared inside the Docker Containers.
If you connect to the Docker container and there are no files at all, make sure that your Drupal and the docker-compose.yml file are within your home folder. If this is not the case, move everything and restart the container via:

```
docker-compose up -d --force
```

### Cannot access any docker sites

The best to solve issues around not accessible docker sites is to try to turn it off and on again:

1. Make sure everything is running correctly

  ```
  cachalot status
  ```

1. Restart cachalot:

  ```
  cachalot restart
  ```

### Cachalot starts with `NFS failed to run`

1. Restart your cachalot with `cachalot restart`
2. Check if your brew installation is all correct, do that with

  ```
  brew doctor
  ```

   and fix any reported issues. Then restart `cachalot restart`

### The `docker` client gives an SSL error or times out

First check that `cachalot` is actually running:

```
cachalot status
```

If not, start it : )

Another common cause is the `DOCKER_*` environment variables not being set correctly. Check the output of `cachalot status` from the same terminal window. If it displays a message such as

    Environment variables not set.

Set them with

```
eval $(cachalot env)
```


### The `docker` client reports errors like `x509: certificate is valid for 192.168.x.y, not 192.168.x.z`

Sometimes the IP address of the docker-machine VM changes on restart, which in turn causes the certificates for the VM to not work. Current versions of docker-machine don't handle this for you, and neither does Dinghy, so to fix this you need to regenerate the certificates with:

    $ docker-machine regenerate-certs amazeeio-cachalot

Replace `cachalot` with the VM machine name if you aren't using the default name.

### I'm running into file permissions issues on the NFS mounted volumes

Unfortunately, there isn't yet a one-size-fits-all solution for sharing folders from the host OS X machine into the Linux VM and then into the docker containers, and permissions issues are sometimes a problem. This isn't an issue unique to cachalot, and is a common point of discussion in projects like Docker Machine as well.

Because cachalot is geared toward development, it optimizes for sharing source code directories between the containers and host, and then uses NFS for performance. This works really well for editing code in OS X and seeing the changes immediately in your running containers, but can cause problems with mounting volumes from the host in some containers that expect files to be owned by certain users, since the files can't be successfully chown'd to the user running in the container.

In practice, this means that it's usually best to run containers such as
Postgres using a normal docker volume, rather than a host-shared volume. This is the default, so normally nothing needs to be done, but you may run into chown errors or other file permissions issues if you try to mount a host volume into such containers.

For more background on the decisions made here, see the discussion in issues such as https://github.com/codekitchen/dinghy/issues/31 and
https://github.com/codekitchen/dinghy/issues/15

In the future, this may be solvable using user namespacing, which was introduced in a very limited form in docker 1.10. It would also be possible in theory to modify the NFS server process to do things such as ignore chown commands, but this isn't currently planned.

### I can't connect to an app running in docker from another VM (commonly to test in IE)

If you are running the Windows VM in VirtualBox, you can configure it to use the host DNS resolver:

    VBoxManage modifyvm "IE11 - Win10" --natdnshostresolver1 on

Replace `"IE11 - Win10"` with the name of your VM. This will allow the VM to resolve and connect directly to your `http://*.docker.amazee.io` services running in cachalot.

## pygmy

Most issues with `pygmy` can be resolved with:

![Have you tried turning it off and on again?](/assets/itsupport.gif)


    pygmy restart -d

If that does not help, try and restart other services, in this order:

1. Docker
2. Reboot your computer

### I get an error like `listen tcp 0.0.0.0:53: bind: address already in use` during `pygmy up`

If during starting of `pygmy` you see an error like that:

        Error response from daemon: driver failed programming external connectivity on endpoint amazeeio-dnsmasq:
        Error starting userland proxy: listen tcp 0.0.0.0:53: bind: address already in use
        Error: failed to start containers: amazeeio-dnsmasq

You are probably on Ubuntu and the by default started DNS server by Ubuntu conflicts with the one we provide with `pygmy`. You should disable it, see here: http://askubuntu.com/a/233223 (no worries, the default started DNS server is actually not used, so it's safe to disable it).

If you still run into the error run following command `sudo netstat -tulpn` to see the processlist look for the service running on port 53 (you should find that process in the `Local Address` column). Look for the Process ID (PID)

With the Process ID you can now run following command:

> sudo kill [Process ID]

## Windows

### I get an error like `ERROR: Network amazeeio-network declared as external, but could not be found.`

You will need to create the shared external network in docker first:

    docker network create amazeeio-network


### I get an error like `ERROR: for amazeeio-haproxy  Cannot create container for service amazeeio-haproxy: b'Mount denied:\nThe source path "\\\\var\\\\run\\\\docker.sock:/tmp/docker.sock"\nis not a valid Windows path'`

Docker for Windows 18 included a change that [breaks path conversion on windows](https://github.com/docker/for-win/issues/1829). You can set an environment variable to force conversions.

Powershell:

    $Env:COMPOSE_CONVERT_WINDOWS_PATHS=1
    
You will need to set this variable for every session or [set it permanently](https://trevorsullivan.net/2016/07/25/powershell-environment-variables/)
