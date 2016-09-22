# Linux & OS X `pygmy`

<!-- toc -->


`pygmy` is the single tool needed to get the amazee.io Docker Drupal Development Environment running on your Linux based system. It is also capable of working together with the very new [Docker for Mac](https://docs.docker.com/docker-for-mac/)! (quite a lot for such a [small whale](https://en.wikipedia.org/wiki/Pygmy_sperm_whale) 🐳)

{% hint style='info' %}
If you don't run the new Docker for Mac: Sorry `pygmy` is not for you, we have a bigger whale for you: `cachalot` for OS X!
{% endhint %}

`pygmy` will handle for you:
* Starting the necessary Docker Containers for the amazee.io Drupal Docker Development
* If on Linux: Adds `nameserver 127.0.0.1` to your `/etc/resolv.conf` file, so that your local Linux can resolve `*.docker.amazee.io` via the dnsmasq container
* If on Mac with Docker for Mac: Creates the file `/etc/resolver/docker.amazee.io` which tells OS X to forward DNS requests for `*.docker.amazee.io` to the dnsmasq container
* Tries to add the ssh key in `~/.ssh/id_rsa` to the ssh-agent container (no worries if that is the wrong key, you can add more any time)



## Prerequisites
Make sure you have the following dependencies installed:

1. Docker (Version >= 1.11.1), see [the official guides](https://docs.docker.com/engine/installation/) how to do that
2. Ruby, see [the official guides ](https://www.ruby-lang.org/en/documentation/installation/)
3. If you are on Ubuntu, disable the DNS that is started by default, see: http://askubuntu.com/a/233223

## Installation
    gem install pygmy

## Start

    pygmy up

`pygmy` will now start all the required Docker containers and add the ssh key.

## Help

See Help for `pygmy`

## CLI Usage

```
pygmy help

Commands:
  pygmy addkey [~/.ssh/id_rsa]  # Add additional ssh-key
  pygmy down                    # Stop and destroy all pygmy services
  pygmy help [COMMAND]          # Describe available commands or one specific command
  pygmy restart                 # Stop and restart all pygmy services
  pygmy status                  # Report status of the pygmy services
  pygmy stop                    # Stop all pygmy services
  pygmy up                      # Bring up pygmy services (dnsmasq, resolv, ssh-agent)
  pygmy version                 # Check current installed version of pygmy
```

### Adding ssh keys

Call the `addkey` command with the **absolute** path to the key you would like to add. In case this they is passphrase protected, it will ask for your passphrase.

    pygmy addkey /Users/amazeeio/.ssh/my_other_key

    Enter passphrase for /Users/amazeeio/.ssh/my_other_ke:
    Identity added: /Users/amazeeio/.ssh/my_other_key (/Users/amazeeio/.ssh/my_other_key)

### Checking the status

Run `pygmy status` and `pygmy` will tell you how it feels right now and which ssh-keys it currently has in it's stomach:

    pygmy status

    [*] Dnsmasq: Running as docker container amazeeio-dnsmasq
    [*] Haproxy: Running as docker container amazeeio-haproxy
    [*] Resolv is properly configured
    [*] ssh-agent: Running as docker container amazeeio-ssh-agent, loaded keys:
    4096 SHA256:QWzGNs1r2dfdfX2PHdPi5sdMxdsuddUbPSi7HsrRAwG43sHI /Users/amazeeio/.ssh/my_other_key (RSA)


### `pygmy down` vs `pygmy stop`

`pygmy` behaves like Docker, it's a whale in the end!  
During regular development `pygmy stop` is perfectly fine, it will keep the Docker containers still alive, just in stopped state.
If you like to cleanup though, use `pygmy down` to really remove the Docker containers.

### Update Docker Containers with `pygmy`

`pygmy` can update shared docker containers for you:

    pygmy update

After it updated all containers, it will recreate them as well.


### Update `pygmy`

`pygmy` gets new releases sometimes and who doesn't like them, so much excitement for new functionality!

As rubygems does not remove old versions of gems when updating, you should remove old version after a new version has been installed.

First update:

    gem update pygmy

    Updating installed gems
    Updating pygmy
    Successfully installed pygmy-0.9.4
    Parsing documentation for pygmy-0.9.4
    Installing ri documentation for pygmy-0.9.4
    Installing darkfish documentation for pygmy-0.9.4
    Done installing documentation for pygmy after 0 seconds
    Parsing documentation for pygmy-0.9.4
    Done installing documentation for pygmy after 0 seconds
    Gems updated: pygmy

A new version!

Now uninstall the old one:

    gem uninstall pygmy

    Select gem to uninstall:
     1. pygmy-0.9.3
     2. pygmy-0.9.4
     3. All versions
    > 1
    Successfully uninstalled pygmy-0.9.3

check the correct version:

    pygmy -v

    Pygmy - Version: 0.9.4
