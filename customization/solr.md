# Solr Customization

amazee.io offers the three Solr versions, and provides a default configuration from the [search\_api\_solr module]([default config](https://github.com/amazeeio/docker/blob/master/solr/)) module for each.

| Solr Version | Drupal Solr Config/Schema |
| -- | -- |
| 3.6.2 | drupal-4.3-solr-3.x. |
| 5.5.3 | drupal-4.4-solr-5.x |
| 6.3.0 | drupal-5.2-solr-6.x |

## Connect Solr Container to Drupal Container

* If already running, shut down the site's drupal container. WARNING: this will delete your site's container. Usually this is perfectly save to do, as the database is saved in a volume which is not deleted. Creating a database backup is encouraged if the database is very important.

  `docker-compose down`

* Update your `docker-compose.yml` with adding the the solr container, see our [example files](https://github.com/amazeeio/docker/) for each Solr and PHP Version. (Do not miss to add links section under `drupal` docker service)

* Start both containers

  `docker-compose up -d`

* Solr will be available on `solr:8983` ipv4 address within the drupal container. Our amazee.io [environment variables](./environment_variables.html) will be filled automatically.

#### Default Config:

* Our Solr Docker images are preconfigured with following files [default Drupal Solr Configs](https://github.com/amazeeio/docker/tree/master/solr).

#### Custom Config:

If you would like to customize your Solr configuration, you can develop and test them in the local development environment. After being satisfied with them, the amazee.io support team will add them to your amazee.io hosted sites.

1. Create the folder `amazeeio/solr-conf` in your project's root folder (same level of your repo as the `docker-compose.yml` file.)
2. Fill the config according to your Solr version from our [default configs](https://github.com/amazeeio/docker/tree/master/solr/)
3. In the `volumes:` section of the `solr:` container in the `docker-compose.yml` file, add the entry which will connect your custom config to solr in the container (it should be already there, just uncomment it)

      `- ./amazeeio/solr-conf:/solr-conf/conf`

4. Restart your containers with `docker-compose restart solr` and verify that the Solr container and config is loaded correctly
5. Change your Solr config according to your needs and restart the container with `docker-compose restart solr`
