# Linux `pygmy`
With beeing able to run Docker natively on Linux, the setup with Linux is a bit easier.

`pygmy` will start:
* [andyshinn/dnsmasq](https://hub.docker.com/r/andyshinn/dnsmasq/) Docker container which will listen on port 53 and resolv all DNS requests from `*.docker.amazee.io` to `127.0.0.1` (so basically a better way then filling your `/etc/hosts` file by hand)
* [amazeeio/haproxy](https://hub.docker.com/r/amazeeio/haproxy/) Docker container which will listen on port 80 and 443. It listens to the Docker socket and will forward HTTP and HTTPs requests to the correct Drupal Container. With that we can access all Drupal Containers via a single Port.
* [amazeeio/ssh-agent](https://hub.docker.com/r/amazeeio/ssh-agent/) Docker container which will keeps an ssh-agent at hand for the other Drupal Containers. With that the Drupal Containers do not need to handle ssh-agenting themselves


#### Prerequisites
1. Docker, see [the official guides](https://docs.docker.com/engine/installation/) how to do that
2. Ruby, see [the official guides ](https://www.ruby-lang.org/en/documentation/installation/)

#### Installation
    $ gem install pygmy

#### Usage

    $ pygmy up

Multiple things will happen now:

1. 