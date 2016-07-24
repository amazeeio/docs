# OS X `cachalot`

<!-- toc -->

 OS X is currently not able to run Docker natively. [Docker announced](https://blog.docker.com/2016/03/docker-for-mac-windows-beta/) a much better system for OS X and also Windows in the making. Until Docker has released their Docker for Mac, we provide our own system, called `cachalot`

{% hint style='info' %}
If you already are using the Docker Mac Beta client, please head over to the `pygmy`, it is fully compatible to Docker Mac Beta. If you like you can apply to the new Docker for Mac Beta here: https://beta.docker.com/
{% endhint %}


`cachalot` will handle for you:
* Start it's own Virtual Machine which runs boot2docker. It does that because the original docker-machine vm is not running on NFS and does not have support for File System Events. Both things which are important for speed and convenience during development.
* Start two services on OS X: FSEvents and NFS (which will share the folder `/User/you` into the virtual machine).
* Creates the file `/etc/resolver/docker.amazee.io` which tells OS X to forward DNS requests for `*.docker.amazee.io` to the dnsmasq Docker container
* Starting the necessary Docker Containers for the amazee.io Drupal Docker Development
* Add the ssh key in `~/.ssh/id_rsa` to the ssh-agent container (no worries if that is the wrong key, you can add more anytime)

### Prerequisites

1. OS X Yosemite (10.10) or newer
1. [Homebrew](http://brew.sh/)
1. Docker and Docker Machine. These can either be installed with Homebrew (`brew install docker docker-machine`), or using a package such as the [Docker Toolbox](https://www.docker.com/products/docker-toolbox).
1. A Virtual Machine provider for Docker Machine. Currently supported options are:
    * **recommended:** [VirtualBox](https://www.virtualbox.org). Version 5.0+ is strongly recommended, and you'll need the [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) installed.
    * [xhyve](http://www.xhyve.org/) installed with [docker-machine-driver-xhyve](https://github.com/zchee/docker-machine-driver-xhyve#install).
    * [VMware Fusion](http://www.vmware.com/products/fusion).
    * [Parallels](https://www.parallels.com/products/desktop/) installed with [docker-machine-parallels](https://github.com/Parallels/docker-machine-parallels).

## Installation

Switch back to your Terminal. First make sure your brew is up to date:

    brew update

Install Docker and Docker machine  
(if you have that installed already, make sure you have the newest versions via `brew upgrade docker docker-machine`)

    brew install docker
    brew install docker-machine

Install cachalot via Brew:

    brew tap amazeeio/cachalot
    brew install cachalot

Create the VM and start services with:

    cachalot create --provider virtualbox

You can specify provider (`virtualbox`, `vmware`, `xhyve` or `parallels`), memory and CPU options when creating the VM. See available options: `cachalot help create`

Once the VM is up, cachalot will tell you it's own status and instructions to add some Docker-related environment variables, so that your Docker client can contact the Docker server inside the VM, do that with:

    eval $(cachalot env)

If you are using **Bash** Shell. We suggest adding that to your `~/.bash_profile` so that the environment variables are available all times:

    echo "eval \$(cachalot env)" >> ~/.bash_profile

Or for **zsh** users:

    echo "eval \$(cachalot env)" >> ~/.zshrc

To check that everything has been installed correctly, open http://docker.amazee.io/stats and you should see a Status Page of haproxy.

**You are all set-up!** Are you ready to get your first site setup on your local environment? Yes? Then head over to [Part II: Drupal Docker Containers](drupal_site_containers.md).

## CLI Usage

```
cachalot help

  amazeeio-cachalot addkey [~/.ssh/id_rsa]  # Add additional ssh-key
  amazeeio-cachalot create                  # create the docker-machine VM
  amazeeio-cachalot destroy                 # stop and delete all traces of the VM
  amazeeio-cachalot docker_halt             # stop and remove the Docker Containers
  amazeeio-cachalot docker_restart          # Restarts all Docker Containers
  amazeeio-cachalot docker_start            # starts the docker containers
  amazeeio-cachalot docker_status           # Get Status of Docker containers
  amazeeio-cachalot docker_stop             # stop the Docker Containers
  amazeeio-cachalot docker_update           # Pulls Docker Images and recreates the Containers
  amazeeio-cachalot env                     # returns env variables to set, should be run like $(amazeeio_cachalot...
  amazeeio-cachalot halt                    # stop the VM and services
  amazeeio-cachalot help [COMMAND]          # Describe available commands or one specific command
  amazeeio-cachalot ip                      # get the VM's IP address
  amazeeio-cachalot myip                    # get the hosts IP address
  amazeeio-cachalot restart                 # restart the VM and services
  amazeeio-cachalot ssh [args...]           # ssh to the VM
  amazeeio-cachalot status                  # get VM and services status
  amazeeio-cachalot up                      # start the Docker VM and services
  amazeeio-cachalot upgrade                 # upgrade the boot2docker VM to the newest available
  amazeeio-cachalot version                 # display amazeeio_cachalot version
```

### Adding additional ssh keys

`cachalot` will add `~/.ssh/id_rsa` per default to the Docker Environment, if you like to add another key, call the `addkey` command with the **absolute** path to the key you would like to add. If the key is passphrase protected, it will ask for your passphrase.

    cachalot addkey /Users/amazeeio/.ssh/my_other_key

    Enter passphrase for /Users/amazeeio/.ssh/my_other_ke:
    Identity added: /Users/amazeeio/.ssh/my_other_key (/Users/amazeeio/.ssh/my_other_key)

### Checking the status

Run `cachalot status` and `cachalot` will tell you how it feels right now and which ssh-keys it currently has in its stomach:

    cachalot status

    [virtual machine]
    running

    [services]
    NFS: running
    FsEvents: running

    [resolver]
    Resolver: correctly configured

    [docker containers]
    Haproxy: Running as docker container amazeeio-haproxy
    Dnsmasq: Running as docker container amazeeio-dnsmasq
    ssh-agent: Running as docker container amazeeio-ssh-agent, loaded keys:
    4096 SHA256:QWzGN1r2X2PHdPi5MxsuUbPSi7HfOuwoSrRAwG43sHI /Users/amazeeio/.ssh/id_rsa (RSA)


    [environment variables]
    Your environment variables are already set correctly.

    amazee.io wishes happy Drupaling!

## Update Docker Containers with `cachalot`

`cachalot` can update shared docker containers for you:

    cachalot docker_update

After it updated all containers, it will recreate them as well.

## Upgrade

To update cachalot itself, run

    cachalot halt
    brew update
    brew upgrade cachalot
    cachalot up

To update the Docker VM, run:

    cachalot upgrade

This will run `docker-machine upgrade` and then restart everything.
