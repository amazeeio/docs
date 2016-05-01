# Get your Drupal site hosted on amazee.io

## Preparation

To get your website running on amazee.io you'll need to prepare three essential things:
- **Codebase**  
This is all your code including Drupal core, themes, modules. It need to live inside a Git Repository.
- **Database**  
Dump the whole Database in a file (to preserve some space and time to transfer compress the file with gzip). We suggest to use [`drush sql-dump`](http://drushcommands.com/drush-8x/sql/sql-dump/) for this.
- **Files**  
Everything under `sites/default/files` needs to be transferred over to the new environment.


## Site configuration

### Step 1: Get Drupal Docker Development Environment

The best and easiest way to get your site running on an amazee.io server, is first to get it running inside our [Drupal Docker Development Environment](local_docker_development/local_docker_development.md). The Docker Environment is exactly the same as the amazee.io servers, so if you site is running inside the Docker Environment, it will also run on the amazee.io servers.

### Step 2: Drupal Docker Container
 
Choose a Drupal Docker Container for your site, create the `docker-compose.yml` file for it and start the containers, see [Drupal Docker Containers](local_docker_development/drupal_site_containers.md) how that works.

You should end up 

 ### Step 3: settings.php

amazee.io has an unique environment variable system, which will tell your Drupal all about the database servers, it's base URL, etc. 
This means there are no hardcoded passwords or usernames anymore. In turn this needs some changes to the already existing settings.php files.

Following you find a very basic example to configure the connection to the database. Just add that at the bottom of existing `settings.php` from Drupal.

```
### amazee.io Database connection
if(getenv('AMAZEEIO_SITENAME')){
  $databases['default']['default'] = array(
    'driver' => 'mysql',
    'database' => getenv('AMAZEEIO_SITENAME'),
    'username' => getenv('AMAZEEIO_DB_USERNAME'),
    'password' => getenv('AMAZEEIO_DB_PASSWORD'),
    'host' => getenv('AMAZEEIO_DB_HOST'),
    'port' => getenv('AMAZEEIO_DB_PORT'),
    'prefix' => '',
  );
}

### amazee.io Base URL
if (getenv('AMAZEEIO_BASE_URL')) {
  $base_url = getenv('AMAZEEIO_BASE_URL');
}
```

We do not suggest to just use this simple configuration for production sites, but for now it's all good. See [Drupal Configuration](drupal/settingsphpfiles.md) for the whole magic of amazee.io settings.php files.



###.amazeeio.yml


##Setup automatic deployment
