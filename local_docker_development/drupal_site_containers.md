# Part II: Drupal Site Containers

During [Installation](./docker_installation.md)  we just started the shared Docker containers. For each Drupal Site we need an own Docker Container:

1. Check your cloned repository and choose the example yaml file you need, see the table at the bottom to choose
2. Copy the example file into your Drupal directory
3. Rename the file to `docker-compose.yml`
4. Edit the file according your needs, change at least the hostname. _Btw: It's perfectly fine to commit this file into your git repo, so others that are also using amazeeio-docker can use it as well._
5. Run `docker-compose up -d` in the same directory
6. Open your browser with the entered URL in the `docker-compose.yml`, happy Drupaling!

## Connect into container

To run commands like drush, git or other things within the container, you need to connect to the container.

	docker exec -itu drupal changeme.com.docker.amazee.io bash

replace `changeme.com.docker.amazee.io` with the docker container you want to connect to

## SSH Agent

Per default your SSH Key at `~/.ssh/id_rsa` is added to the Docker containers.

If you have a passphrase protected SSH key or need another SSH Key, run this command from the this directory (not inside the Drupal directory, also you don't need to do that for each Drupal site, just once)

	docker-compose run --rm ssh-agent_add_key ssh-add /ssh/id_rsa

replace `id_rsa` with the ssh private key from your `~/ssh/` folder you would like to add, `/ssh/` is mounted from `~/ssh/`

## Existing Docker Images

| Example File  | PHP  | Services | Description |
| ------------- | ------------- | ------------- | ------------- |
| `php70-basic` | 7.0 | nginx, varnish, mariadb | prefered for Drupal 8 |
| `php56-basic` | 5.6 | nginx, varnish, mariadb | prefered for Drupal 7 |
| `php70-composer` | 7.0 | nginx, varnish, mariadb | For [Drupal Composer Project](https://github.com/drupal-composer/drupal-project), the Drupal root expected in the folder `/web` |
| `php56-composer` | 5.6 | nginx, varnish, mariadb | For [Drupal Composer Project](https://github.com/drupal-composer/drupal-project), the Drupal root expected in the folder `/web` |

## Update Images

If you need to update the Docker Images to the newest version from the Docker Hub run:

	docker-compose pull
	docker-compose up -d