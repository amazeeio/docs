# amazee.io Local Drupal Docker Development

amazee.io fully supports development work flows which involve local development sites. We provide a Drupal Docker development environment that runs on our local computer.
It uses the exact same configuration for **all** services like on production. This means:
 - If the site runs locally, it also runs on production
 - You can use the exact same `settings.php` file for local and production

**And the best:** You don't need to have any amazee.io account or site running to use the local development environment! Just install it, and use all the power of amazee.io for free.

This docker based Drupal Development environment consists of two parts:

### Part I: Shared Docker Containers

The shared docker containers for HAProxy and the SSH Agent, these are used by all other containers in order to properly work. They are started either with `cachalot` for OSX or `pygmy` for Linux.

#### [Part I for OS X `cachalot`](local_docker_development/os_x_cachalot.md)

#### Part I for Linux `pygmy`


### [Part II: Example Containers](./drupal_site_containers.md)

Example files for Drupal development containers, these are made to be copied into a Drupal root directory and to be started from there.


## How it works
* [andyshinn/dnsmasq](https://hub.docker.com/r/andyshinn/dnsmasq/) Docker container which will listen on port 53 and resolv all DNS requests from `*.docker.amazee.io` to `127.0.0.1` (so basically a better way then filling your `/etc/hosts` file by hand)
* [amazeeio/haproxy](https://hub.docker.com/r/amazeeio/haproxy/) Docker container which will listen on port 80 and 443. It listens to the Docker socket and will forward HTTP and HTTPs requests to the correct Drupal Container. With that we can access all Drupal Containers via a single Port.
* [amazeeio/ssh-agent](https://hub.docker.com/r/amazeeio/ssh-agent/) Docker container which will keeps an ssh-agent at hand for the other Drupal Containers. With that the Drupal Containers do not need to handle ssh-agenting themselves