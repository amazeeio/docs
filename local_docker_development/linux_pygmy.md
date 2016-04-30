# Linux `pygmy`
`pygmy` is the single tool needed to get the amazee.io Docker Drupal Development Environment running on your Linux based system. It is also capable of working together with the very new [Docker for Mac Beta](https://blog.docker.com/2016/03/docker-for-mac-windows-beta/)! (quite a lot for such a [small whale](https://en.wikipedia.org/wiki/Pygmy_sperm_whale))

`pygmy` will handle for you:
* Starting the necessary Docker Containers for the amazee.io Drupal Docker Development
* If on Linux: Add `nameserver 127.0.0.1` to your `/etc/resolv.conf` file, so that your local Linux can resolve `*.docker.amazee.io` via the dnsmasq container
* If on Mac with Docker Beta: Create the file `/etc/resolver/docker.amazee.io` which tells OS X to forward DNS requests for `*.docker.amazee.io` to the dnsmasq container
* Trying to add the ssh key in `~/.ssh/id_rsa` to the ssh-agent container (no worries if that is the wrong key, you can add more any time)



## Prerequisites
1. Docker, see [the official guides](https://docs.docker.com/engine/installation/) how to do that
2. Ruby, see [the official guides ](https://www.ruby-lang.org/en/documentation/installation/)

## Installation
    gem install pygmy

## Start

    pygmy up

`pygmy` will now start all the required Docker containers and add the ssh key.

## CLI Usage

```
$ pygmy help

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

    $ pygmy addkey /Users/amazeeio/.ssh/my_other_key
    
    Enter passphrase for /Users/amazeeio/.ssh/my_other_ke:
    Identity added: /Users/amazeeio/.ssh/my_other_key (/Users/amazeeio/.ssh/my_other_key) 
    
### Checking the status
Run `pygmy status` and `pygmy` will tell you how it fells right now and which ssh-keys it currently has in it's stomach:

    $ pygmy status
    
    [*] Dnsmasq: Running as docker container amazeeio-dnsmasq
    [*] Haproxy: Running as docker container amazeeio-haproxy
    [*] Resolv is properly configured
    [*] ssh-agent: Running as docker container amazeeio-ssh-agent, loaded keys:
    4096 SHA256:QWzGNs1r2dfdfX2PHdPi5sdMxdsuddUbPSi7HsrRAwG43sHI /Users/amazeeio/.ssh/my_other_key (RSA)
    

### `pygmy down` vs `pygmy stop`
`pygmy` behaves like Docker, it's a whale in the end!  
During regular development `pygmy stop` is perfectly fine, it will keep the Docker containers still alive, just in stopped state.
If you like to cleanup though, use `pygmy down` to really remove the Docker containers.
