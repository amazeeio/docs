# OS X - Cachalot

 OS X is currently not able to run Docker natively. [Docker announced](https://blog.docker.com/2016/03/docker-for-mac-windows-beta/) a much better system for OS X and also Windows in the making. 
 
Currently we provide our own system to run on OS X. Its called **cachalot** and can be found here: https://github.com/amazeeio/cachalot

Cachalot provides faster volume sharing via NFS, Filesystem event forwarding and easier access to the sites via a DNS server.

#### Prerequisites

1. OS X Yosemite (10.10) or higher
1. [Homebrew](https://github.com/Homebrew/homebrew)
1. Docker and Docker Machine. These can either be installed with Homebrew (`brew install docker docker-machine`), or using a package such as the [Docker Toolbox](https://www.docker.com/products/docker-toolbox).
1. A Virtual Machine provider for Docker Machine. Currently supported options are:
    * [xhyve](http://www.xhyve.org/) installed with [docker-machine-driver-xhyve](https://github.com/zchee/docker-machine-driver-xhyve#install).
    * [VirtualBox](https://www.virtualbox.org). Version 5.0+ is strongly recommended, and you'll need the [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) installed.
    * [VMware Fusion](http://www.vmware.com/products/fusion).
    * [Parallels](https://www.parallels.com/products/desktop/) installed with [docker-machine-parallels](https://github.com/Parallels/docker-machine-parallels).

#### Installation

Install cachalot via Brew:

    $ brew tap amazeeio/cachalot
    $ brew install cachalot

Create the VM and start services with:

    $ amazeeio-cachalot create --provider virtualbox

You can specify provider (`virtualbox`, `vmware`, `xhyve` or `parallels`), memory and CPU options when creating the VM. See available options: `amazeeio-cachalot help create`

Once the VM is up, you'll get instructions to add some Docker-related environment variables, so that your Docker client can contact the Docker server inside the VM. We suggest adding that to your `~/.bashrc` so that they are available all times.

To check that everything has been installed correctly:

    $ docker run hello-world

## CLI Usage

```
$ amazeeio-cachalot help
Commands:
  amazeeio-cachalot create          # create the docker-machine VM
  amazeeio-cachalot destroy         # stop and delete all traces of the VM
  amazeeio-cachalot halt            # stop the VM and services
  amazeeio-cachalot help [COMMAND]  # Describe available commands or one specific command
  amazeeio-cachalot ip              # get the VM's IP address
  amazeeio-cachalot restart         # restart the VM and services
  amazeeio-cachalot env             # returns env variables to set, should be run like $(amazeeio-cachalot env)
  amazeeio-cachalot ssh [args...]   # ssh to the VM
  amazeeio-cachalot status          # get VM and services status
  amazeeio-cachalot up              # start the Docker VM and services
  amazeeio-cachalot upgrade         # upgrade the boot2docker VM to the newest available
  amazeeio-cachalot version         # display amazeeio-cachalot version
```

## DNS

Cachalot installs a DNS server listening on the private interface, which resolves `*.docker.amazee.io` to the Cachalot VM.

## NFS

Cachalot shares your home directory (`/Users/<you>`) over NFS, using a private network interface between your host machine and the cachalot Docker Host. This sharing is done using a separate NFS daemon, not the system NFS daemon.

## Upgrade

To update cachalot itself, run

    $ amazeeio-cachalot halt
    $ brew update
    $ brew upgrade cachalot
    $ amazeeio-cachalot up

To update the Docker VM, run:

    $ amazeeio-cachalot upgrade

This will run `docker-machine upgrade` and then restart the amazeeio-cachalot services.

