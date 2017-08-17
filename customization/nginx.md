# nginx Customization #

By default, the amazee.io nginx configuration will only allow execution of index.php. If you require a customized nginx configuration, we welcome you to test locally using the Docker environment, and then amazee.io will review your customizations and add to your sites when ready.

Some reasons for having a custom nginx configuration can include:

* Custom redirects

* Bulk redirects \(e.g. moving an old gallery software into Drupal\)

* Basic Authentication required on a specific path

* Access to custom PHP script


To create a test a custom nginx configuration:

* Stop your Drupal Docker container if running

  `docker-compose down`

* Create an `amazeeio` directory with `nginx` subdirectory in the same level as the docker-compose.yml file in your repo

  * Both `10fe-drupal.conf` and `20be-drupal.conf` are needed, however, your customizations should be in `20be-drupal.conf`



* Copy the example nginx configuration into the amazeeio/nginx directory

* Add an entry to the `volumes:` section of `docker-compose.yml`

  `- ./amazeeio/nginx:/etc/nginx/sites-enabled`

* Start the Drupal Docker container

  `docker-compose up -d`




