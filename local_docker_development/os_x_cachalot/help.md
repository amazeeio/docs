# OS X `cachalot` Help

<!-- toc -->

Solutions to many common problems can be found here.

## Cannot access any docker sites

The best to solve issues around not accessible docker sites is to try to turning it off and on again:

1. Make sure everything is running

  `amazeeio-cachalot status`
1. Halt cachalot with (check that there are no errors)

  `amazeeio-cachalot halt`
1. Kill the dnsmasq service:

  `sudo killall dnsmasq`
1. Tell OS X to update it's DNS cache:

  `sudo killall mDNSResponder`
1. Start cachalot again:

  `amazeeio-cachalot up`
1. Start docker containers again

## Cachalot starts with `DNS failed to run`

Do the same as above, start at Nr. 2.
If after that it still does not work, check if your brew installation works, do that with:
  
    brew doctor

## Cachalot starts with `NFS failed to run`

Check if your brew installation works, do that with 
  
    brew doctor

## The `docker` client gives an SSL error or times out

The most common cause is the `DOCKER_*` environment variables not being set correctly. Check the output of `amazeeio-cachalot status` from the same terminal window. If it displays a message such as

    To connect the Docker client to the Docker daemon, please set:

    export DOCKER_HOST=tcp://192.168.99.101:2376

This means your environment variables aren't correctly set. 

Of course if `amazeeio-cachalot status` reports that the VM is stopped, you should run `amazeeio-cachalot up` as well.

## The `docker` client reports errors like `x509: certificate is valid for 192.168.x.y, not 192.168.x.z`

Sometimes the IP address of the docker-machine VM changes on restart, which in turn causes the certificates for the VM to not work. Current versions of docker-machine don't handle this for you, and neither does Dinghy, so to fix this you need to regenerate the certificates with:

    $ docker-machine regenerate-certs amazeeio-cachalot

Replace `amazeeio-cachalot` with the VM machine name if you aren't using the default name.

## I'm running into file permissions issues on the NFS mounted volumes

Unfortunately, there isn't yet a one-size-fits-all solution for sharing folders from the host OS X machine into the Linux VM and then into the docker containers, and permissions issues are sometimes a problem. This isn't an issue unique to Dinghy, and is a common point of discussion in projects like Docker Machine as well.

Because Dinghy is geared toward development, it optimizes for sharing source code directories between the containers and host, and then uses NFS for performance. This works really well for editing code in OS X and seeing the changes immediately in your running containers, but can cause problems with mounting volumes from the host in some containers that expect files to be owned by certain users, since the files can't be successfully chown'd to the user running in the container.

In practice, this means that it's usually best to run containers such as
postgres using a normal docker volume, rather than a host-shared volume. This is the default, so normally nothing needs to be done, but you may run into chown errors or other file permissions issues if you try to mount a host volume into such containers.

For more background on the decisions made here, see the discussion in issues such as https://github.com/codekitchen/dinghy/issues/31 and
https://github.com/codekitchen/dinghy/issues/15

In the future this may be solvable using user namespacing, which was introduced in a very limited form in docker 1.10. It would also be possible in theory to modify the NFS server process to do things such as ignore chown commands, but this isn't currently planned.

## I can't connect to an app running in docker from another VM (commonly to test in IE)

If you are running the Windows VM in VirtualBox, you can configure it to use the host DNS resolver:

    VBoxManage modifyvm "IE11 - Win10" --natdnshostresolver1 on

Replace `"IE11 - Win10"` with the name of your VM. This will allow the VM to resolve and connect directly to your `http://*.docker.amazee.io` services running in cachalot.



