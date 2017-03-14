# Solr Customization

amazee.io offers the following Solr versions, and provides a default configuration from the [search\_api\_solr module](http://dgo.to/search_api_solr) module for each.
||Version||Schema||
| 3.6.2 | drupal-4.3-solr-3.x. |
| 5.5.3 | drupal-4.4-solr-5.x |
| 6.3.0 | drupal-5.2-solr-6.x |

If it is desired to customize your Solr configuration, use the following steps as a guide to making these modifications in our local development environment. After it is exhibited that they work correctly in Docker, we can then add the changes to your amazee.io hosted sites.

## Solr 3

* If already running, shut down the site's drupal container. WARNING: this will delete your site's container, but that is necessary for these changes, save a copy of your database first if it is important to you

  `docker-compose down`

* Create an `amazeeio` directory with a `solr` subdirectory, in the same level of your repo as the `docker-compose.yml file.`

* Copy the [example config files](http://cgit.drupalcode.org/search_api_solr/tree/solr-conf/3.x) from the `search_api_solr module into the amazeeio/solr directory.`

* Ensure that your `docker-compose.yml` file has one of our Solr capable images set as the `image`. See our [example files](https://github.com/amazeeio/docker)


* In the `volumes:` section of the `docker-compose.yml` file, add the entry which will connect your custom config to solr in the container

  `- ./amazeeio/solr:/etc/solr/conf/drupal/conf`


* Start the drupal docker container

  `docker-compose up -d`

## Solr 5/6

* If already running, shut down the site's drupal container. WARNING: this will delete your site's container, but that is necessary for these changes, save a copy of your database first if it is important to you.

  `docker-compose down`

* Create an `amazeeio` directory with a `solr` subdirectory, in the same level of your repo as the `docker-compose.yml file.`

* Copy the appropriate [conf directory](https://github.com/amazeeio/docker-solr) from our docker-solr repo into the `amazeeio/solr` directory. Hint: make sure the path to `schema.xml` is `amazeeio/solr/conf/schema.xml`.

* Ensure that your `docker-compose.yml` file is one which includes the correct solr service you would like to run. See our [example files](https://github.com/amazeeio/docker)

* Under the `solr` service definition, add a `volume` entry like

```    volumes:
      - ./amazeeio/solr:/solr-conf
```


* Start the containers with `docker-compose up -d`
