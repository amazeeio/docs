# Local Docker Customizations
If you need to customize our docker images to add some tools for local development, use these instructions as a guide.

1. Replace the `image` section of your `docker-compose.yml` file with `build: .`
2. Create a `Dockerfile` in the same directory as your `docker-compose.yml`
  * Begin your `Dockerfile` with `FROM amazeeio/php70-basic`
  * Add your commands to make your changes, if you are installing packages, it is helpful to first do a `RUN apt-get update` in the custom image, so that you can then install packages via `apt-get install`
  * It is *not* recommended to have an `ENTRYPOINT` or `CMD`, as these would override our scripts that run services like nginx, mariadb, php-fpm, etc.
  * For further help, consult the [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
3. Run `docker-compose build` to build your custom image
4. Start your site's container as normal using `docker-compose up -d`

Remember, these customizations are for local development *only*, we do not run these custom images on our development or production servers.
