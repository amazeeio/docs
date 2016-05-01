# Get your Drupal Site hosted on amazee.io

## Preparation

To get your website running on amazee.io you'll need to prepare three essential things:
- **Codebase**  
This is all your code including Drupal core, themes, modules. It need to live inside a Git Repository.
- **Database**  
Dump the whole Database in a file (to preserve some space and time to transfer compress the file with gzip). We suggest to use [`drush sql-dump`](http://drushcommands.com/drush-8x/sql/sql-dump/) for this.
- **Files**  
Everything under `sites/default/files` needs to be transferred over to the new environment.


## Setup your site


### settings.php

amazee.io has an unique environment variable system, which will tell your Drupal all about the database servers, it's base URL, etc. 
This means there are no hardcoded passwords or usernames anymore. In turn this needs some changes to the already existing settings.php files.

Following you find a very basic example to configure the connection to the database.

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

### Base URL
if (getenv('AMAZEEIO_BASE_URL')) {
  $base_url = getenv('AMAZEEIO_BASE_URL');
}
```

For more complex configuration examples head over to [Settings.php Files](./drupal/settingsphpfiles.html)



###.amazeeio.yml


##Setup automatic deployment
