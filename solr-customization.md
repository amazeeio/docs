# Solr Customization

amazee.io offers the following Solr versions, and provides a default configuration from the [search\_api\_solr module]([default config](https://github.com/amazeeio/docker/blob/master/solr/) module for each.

| Version | Schema |
| -- | -- |
| 3.6.2 | drupal-4.3-solr-3.x. |
| 5.5.3 | drupal-4.4-solr-5.x |
| 6.3.0 | drupal-5.2-solr-6.x |

If it is desired to customize your Solr configuration, use the following steps as a guide to making these modifications in our local development environment. After it is exhibited that they work correctly in Docker, we can then add the changes to your amazee.io hosted sites.

## Set up config files

* If already running, shut down the site's drupal container. WARNING: this will delete your site's container, but that is necessary for these changes, save a copy of your database first if it is important to you

  `docker-compose down`

* Ensure that your `docker-compose.yml` file has one of our Solr capable images set as the `image`. See our [example files](https://github.com/amazeeio/docker/blob/master/solr)

* Start the drupal docker container

  `docker-compose up -d`

* Solr will be available on `solr:8983` ipv4 address.

#### Default Config:

* Amazeeio solr docker images are preconfigured with following files [default config](https://github.com/amazeeio/docker/blob/master/solr/).

#### Custom Config:

In case you need a custom config, you need to add it to `amazeeio/solr-conf` folder in your project's root folder (same level of your repo as the `docker-compose.yml` file.) before starting container.

* In the `volumes:` section of the `docker-compose.yml` file, add the entry which will connect your custom config to solr in the container

  `- ./amazeeio/solr-conf:/solr-conf`

You also can find a example in [amazee.io's docker repo](https://github.com/amazeeio/docker/blob/master/solr/)
