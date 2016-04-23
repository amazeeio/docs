# amazee.io Local Drupal Docker Development

amazee.io fully supports development work flows which involve local development sites. We provide a Docker development environment that runs on our local computer.
It uses the exact same configuration for **all** services. This means:
 - If the site runs locally, it also runs on production
 - You can use the exact same `settings.php` file for local and production

And the best: You don't need to have any amazee.io account or site running to use the local development environment! Just install it, and use all the power of amazee.io for free.

This docker based Drupal Development environment consists of two parts:

### Part I: Shared Docker Containers

The shared docker containers for HAProxy and the SSH Agent, these are used by all other containers in order to properly work. They are started with the `docker-compose.yml` in the repo folder.

### Part II: Example Containers
Example files for Drupal development containers, these are made to be copied into a Drupal root directory and to be started from there.