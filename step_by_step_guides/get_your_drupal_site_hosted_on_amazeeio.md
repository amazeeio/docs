# Get your Drupal Site hosted on amazee.io

##Preparation
To get your website running on amazee.io you'll need to prepare three essential things:
- **Codebase**  
This is all your code including Drupal core, themes, modules. Best put this up on your GitHub or BitBucket Account
- **Database**  
Dump the whole Database in a file (to preserve some space and time to transfer compress the file with gzip)
- **Files**  
Everything under `sites/default/files` needs to be transfered over to the new environment.

##System Setup
###Prepare a site on amazee.io
###Configure ssh keys for accesssing amazee.io

##Setup your site

###settings.php
Amazee.io has the abillity to configure the site automatically according to the environment which the site is currently running. This means there are no hardcoded passwords or usernames anymore. In turn this needs some changes to the already existing settings.php files. 

Following you find a very basic example to configure the connection to the database.

```
### AMAZEE.IO Database connection
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
if (getenv('AMAZEEIO_SITE_URL')) {
  $base_url = 'http://' . getenv('AMAZEEIO_SITE_URL');
}
```

For more complex configuration examples head over to [Settings.php Files](./drupal/settingsphp
files)



###.amazeeio.yml

##Setup automatic deployment