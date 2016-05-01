# Get your Drupal site hosted on amazee.io


## Preparation

To get your website running on amazee.io you'll need to prepare three essential things:
- **Codebase**  
This is all your code including Drupal core, themes, modules. It needs to live inside a Git Repository.
- **Database**  
Dump the whole Database in a file (to preserve some space and time to transfer compress the file with gzip). We suggest to use [`drush sql-dump`](http://drushcommands.com/drush-8x/sql/sql-dump/) for this.
- **Files**  
Everything under `sites/default/files` needs to be transferred over to the new environment.


## Site configuration

### Step 1: Get Drupal Docker Development Environment

The best and easiest way to get your site running on an amazee.io server, is first to get it running inside our [Drupal Docker Development Environment](local_docker_development/local_docker_development.md). The Docker Environment is exactly the same as the amazee.io servers, so if you site is running inside the Docker Environment, it will also run on the amazee.io servers.

### Step 2: Drupal Docker Container
 
Choose a Drupal Docker Container for your site, create the `docker-compose.yml` file for it and start the containers, see [Drupal Docker Containers](local_docker_development/drupal_site_containers.md) how that works.

You should end up with a Terminal like this:

    $ docker-compose up -d
    Creating amazee_io.docker.amazee.io
    
    $ docker exec -itu drupal amazee_io.docker.amazee.io bash
    🔨 drupal@amazee_io.docker.amazee.io:~/public_html (dev)$

Please make sure that this `public_html` directory is the same where your Drupal lives in, so where the `index.php` file is:

    $ ll index.php
    -rw-r--r-- 1 501 dialout 549 Apr 26 06:11 index.php


Important for [Drupal Composer Project Users](https://github.com/drupal-composer/drupal-project):  
You will not see an `index.php` file here, instead you will see a `web` folder and a `composer.json` file. Plus when you run `drush` later, first change into the directory where the Drupal `index.php` file is (most probably just via `cd web`)

### Step 3: settings.php

amazee.io has an unique environment variable system, which will tell your Drupal all about the environment it is in, like where to find the Database, how to connect to it.  
This has two main advantages:
1. There are no paswords or usernames at all saved in settings.php files, so you safelly share your whole Drupal Code, without being worried, that somebody know credentials about your site.
2. The settings.php is the exact same one, no mather if the Drupal is running on your Local Docker, on the development or production site.

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

### Step 4: Test connection to the database

It's time to test! Easiest is that done with Drush, it will tell you some information about your site:
    
    🔨  drupal@amazee_io.docker.amazee.io:~/public_html (dev)$ drush status
    
    Drupal version         :  8.0.6
    Site URI               :  http://amazee_io.docker.amazee.io
    Database driver        :  mysql
    Database hostname      :  127.0.0.1
    Database port          :  3306
    Database username      :  drupal
    Database name          :  drupal
    PHP executable         :  /opt/php7.0//php
    PHP configuration      :  /etc/php/7.0/cli/php.ini
    PHP OS                 :  Linux
    Drush script           :  /opt/drush/8/vendor/drush/drush/drush.php
    Drush version          :  8.0.5
    Drush temp directory   :  /tmp
    Drush configuration    :  /var/www/drupal/public_html/sites/default/drushrc.php
    Drush alias files      :  /var/www/drupal/public_html/sites/default/aliases.drushrc.php
    Drupal root            :  /var/www/drupal/public_html
    Drupal Settings File   :  sites/default/settings.php
    Site path              :  sites/default
    Sync config path       :  sites/default/config/sync
    
Your output may look a slightly bit different then this one. Here are the things you should see.

The database connection:

    Database hostname      :  127.0.0.1
    Database port          :  3306
    Database username      :  drupal
    Database name          :  drupal
    
The Site URI which should be the same as you defined in the `docker-compose.yml`

    Site URI               :  http://amazee_io.docker.amazee.io

### Step 5: Install Drupal

It's time to install Drupal and test the site in your browser! Again best and easiest done via Drush, this time via `drush site-install`

    🔨 drupal@amazee_io.docker.amazee.io:~/public_html (dev)$ drush site-install
    
    You are about to DROP all tables in your 'drupal' database. Do you want to continue? (y/n): y
    
    Starting Drupal installation. This takes a while. Consider using the --notify global option.
    sh: 1: /usr/sbin/sendmail: not found
    Installation complete.  User name: admin  User password: rWYwHTxCK4
    Unable to send email. Contact the site administrator if the problem persists.
    Congratulations, you installed Drupal!

Thats it! Now visit the URL you defined for you Docker Container in your browser and you should see a fresh installed Drupal Site. In this example this is `http://amazee_io.docker.amazee.io`

Congratulations! You just created your first amazee.io Drupal Site!

<img src="../giphy.gif" width="200">

###.amazeeio.yml


##Setup automatic deployment
