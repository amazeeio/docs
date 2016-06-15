# OS X `cachalot` Help

<!-- toc -->

Solutions to many common problems can be found here.

## Cannot access any docker sites

The best to solve issues around not accessible docker sites is to try to turn it off and on again:

1. Make sure everything is running correctly

  ```
  amazeeio-cachalot status
  ```

1. Restart cachalot:

  ```
  amazeeio-cachalot restart
  ```


## Cachalot starts with `NFS failed to run`

1. Restart your cachalot with `amazeeio-cachalot restart`
2. Check if your brew installation is all correct, do that with

  ```
  brew doctor
  ```

   and fix eventual issues. Then restart `amazeeio-cachalot restart`

## I get an error like `port is already allocated.` during start

If during the start of Docker containers you see an error like that:

  ```
  docker: Error response from daemon: driver failed programming external connectivity on endpoint
  amazeeio-haproxy (654d1f1c17b0f7304570a763e1017808b214b81648045a5c64ed6a395daeec92):
  Bind for 0.0.0.0:443 failed: port is already allocated.
  ```

This means that another service (can be another Docker container, or in case of Linux based systems another service like an installed nginx) is already using this Port.

You should stop this service or Docker container first.

## The `docker` client gives an SSL error or times out

First check that `cachalot` is actually running:

```
amazeeio-cachalot status
```

If not, start it : )

Another common cause is the `DOCKER_*` environment variables not being set correctly. Check the output of `amazeeio-cachalot status` from the same terminal window. If it displays a message such as

    Environment variables not set.

Set them with

  eval $(amazeeio-cachalot env)


## The `docker` client reports errors like `x509: certificate is valid for 192.168.x.y, not 192.168.x.z`

Sometimes the IP address of the docker-machine VM changes on restart, which in turn causes the certificates for the VM to not work. Current versions of docker-machine don't handle this for you, and neither does Dinghy, so to fix this you need to regenerate the certificates with:

    $ docker-machine regenerate-certs amazeeio-cachalot

Replace `amazeeio-cachalot` with the VM machine name if you aren't using the default name.

## I'm running into file permissions issues on the NFS mounted volumes

Unfortunately, there isn't yet a one-size-fits-all solution for sharing folders from the host OS X machine into the Linux VM and then into the docker containers, and permissions issues are sometimes a problem. This isn't an issue unique to cachalot, and is a common point of discussion in projects like Docker Machine as well.

Because cachalot is geared toward development, it optimizes for sharing source code directories between the containers and host, and then uses NFS for performance. This works really well for editing code in OS X and seeing the changes immediately in your running containers, but can cause problems with mounting volumes from the host in some containers that expect files to be owned by certain users, since the files can't be successfully chown'd to the user running in the container.

In practice, this means that it's usually best to run containers such as
Postgres using a normal docker volume, rather than a host-shared volume. This is the default, so normally nothing needs to be done, but you may run into chown errors or other file permissions issues if you try to mount a host volume into such containers.

For more background on the decisions made here, see the discussion in issues such as https://github.com/codekitchen/dinghy/issues/31 and
https://github.com/codekitchen/dinghy/issues/15

In the future, this may be solvable using user namespacing, which was introduced in a very limited form in docker 1.10. It would also be possible in theory to modify the NFS server process to do things such as ignore chown commands, but this isn't currently planned.

## I can't connect to an app running in docker from another VM (commonly to test in IE)

If you are running the Windows VM in VirtualBox, you can configure it to use the host DNS resolver:

    VBoxManage modifyvm "IE11 - Win10" --natdnshostresolver1 on

Replace `"IE11 - Win10"` with the name of your VM. This will allow the VM to resolve and connect directly to your `http://*.docker.amazee.io` services running in cachalot.
