# Solr Customization

In production, amazee.io currently runs Solr 3.6.2, and by default we provide schema drupal-4.3-solr-3.x., as provided by the [search\_api\_solr module](http://dgo.to/search_api_solr)

If it is desired to customize your Solr configuration, use the following steps as a guide to making these modifications in our local development environment. After it is exhibited that they work correctly in Docker, we can then add the changes to your amazee.io hosted sites.

* If already running, shut down the site's drupal container

  `docker-compose down`

* Create an `amazeeio` directory with a `solr` subdirectory, in the same level of your repo as the `docker-compose.yml file.`

* Copy the [example config files](http://cgit.drupalcode.org/search_api_solr/tree/solr-conf/3.x) from the `search_api_solr module into the amazeeio/solr directory.`

* Ensure that your `docker-compose.yml` file has one of our Solr capable images set as the `image`


* In the \`volumes: section of the docker-compose.yml file, add the entry which will connect your custom config to solr in the container

  `- ./docker/solr:/etc/solr/conf/drupal/conf`


* Start the drupal docker container `docker-compose up -d`




