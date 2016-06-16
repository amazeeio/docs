# Part II: Drupal Docker Containers

<!-- toc -->

During [Part I](./local_docker_development.md#part-i-shared-docker-containers) we just started the shared Docker containers. For each Drupal Site we need an own Docker Container:

## Prerequisites
* [Docker Compose](https://docs.docker.com/compose/install/) (Version >= 1.7.0)
  * On OS X just run `brew install docker-compose`

## Find the right `docker-compose.yml`

1. Visit https://github.com/amazeeio/docker or clone https://github.com/amazeeio/docker.git into a folder on your computer
2. Copy the desired example file into your Drupal directory
3. Rename the file to `docker-compose.yml`
4. Edit the file according to your needs, change at least the hostname. _Btw: It's perfectly fine to commit this file into your git repo, so others that are also using amazee.io docker can use it as well._
5. Run in the same directory as the `docker-compose.yml`:

        docker-compose up -d
6. Open your browser with the entered URL in the `docker-compose.yml`, happy Drupaling!

## Connect to the container

To run commands like `git` or other things within the container, you need to connect to the container.

There are two ways for that:

#### Connect via `docker-compose`

This is the easier way, you need to be in the same folder where also the `docker-compose.yml` for that to work:

    docker-compose exec --user drupal drupal bash

#### Connect via `docker`

If you want to connect to a container wherever you are right now with your bash:

	docker exec -itu drupal changeme.com.docker.amazee.io bash

*Replace `changeme.com.docker.amazee.io` with the docker container you want to connect to*

### Drush from your host machine

To use drush, you can either connect to the container as above, or add a bash function that will connect for you to run your drush command. To add the function, add this to your .bashrc file:

```
ddrush() {
  docker-compose exec --user drupal drupal bash -c "source ~/.bash_envvars && cd /var/www/drupal/public_html/\"\$WEBROOT\" && drush $@"
}
```

When you next start a bash session, you'll be able to use `ddrush` just like your normal `drush` command.

## SSH Agent

Per default your SSH Key at `~/.ssh/id_rsa` is added to the Docker containers from either `cachalot` or `pygmy`

If you need another key, read the documentation of [`cachalot`](os_x_cachalot.md) or [`pygmy`](linux_pygmy.md) about this.

## Update Images

We constantly make improvements, updates and some other nice things to our container images. Visit [changelog.amazee.io](https://changelog.amazee.io) to see if there is something new. If you need to update the Docker Images to the newest version from the Docker Hub run in the same folder as the `docker-compose.yml`:

	docker-compose pull
	docker-compose up -d

## `docker-compose.yml` example files

| Example File                                                                                  | PHP | Services                      | Description                                                                                                                     |
|-----------------------------------------------------------------------------------------------|-----|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| [`php70-basic`](https://github.com/amazeeio/docker/blob/master/example-php70-basic.yml)       | 7.0 | nginx, varnish, mariadb       | prefered for Drupal 8                                                                                                           |
| [`php56-basic`](https://github.com/amazeeio/docker/blob/master/example-php56-basic.yml)       | 5.6 | nginx, varnish, mariadb       | prefered for Drupal 7                                                                                                           |
| [`php70-composer`](https://github.com/amazeeio/docker/blob/master/example-php70-composer.yml) | 7.0 | nginx, varnish, mariadb       | For [Drupal Composer Project](https://github.com/drupal-composer/drupal-project), the Drupal root expected in the folder `/web`, or another folder (configurable in the `docker-compose.yml`) |
| [`php56-composer`](https://github.com/amazeeio/docker/blob/master/example-php56-composer.yml) | 5.6 | nginx, varnish, mariadb       | For [Drupal Composer Project](https://github.com/drupal-composer/drupal-project), the Drupal root expected in the folder `/web`, or another folder (configurable in the `docker-compose.yml`) |
| [`php70-solr`](https://github.com/amazeeio/docker/blob/master/example-php70-solr.yml)         | 7.0 | nginx, varnish, mariadb, solr | The same as php70-basic but additionally Apache Solr installed. Check the yaml file on how to define your solr configs          |
| [`php56-solr`](https://github.com/amazeeio/docker/blob/master/example-php56-solr.yml)         | 5.6 | nginx, varnish, mariadb, solr | The same as php56-basic but additionally Apache Solr installed. Check the yaml file on how to define your solr configs          |
