# Get your Drupal Site running on amazee.io

<!-- toc -->

Running on Mac OS X? We created a [fully documented step by step guide on our blog](https://stories.amazee.io/easy-local-drupal-development-on-os-x-a01a343f99e3) for you.

## Site Setup

### Step 1: Get Drupal Docker Development Environment

The best and easiest way to get your site running on an amazee.io server, is first to get it running inside our [Drupal Docker Development Environment](../local_docker_development/local_docker_development.md). The Docker Environment is exactly the same as the amazee.io servers, so if you site is running inside the Docker Environment, it will also run on the amazee.io servers.

### Step 2: Drupal Docker Container

Choose a Drupal Docker Container for your site, create the `docker-compose.yml` file for it and start the containers, see [Drupal Docker Containers](../local_docker_development/drupal_site_containers.md) how that works.

You should end up with a Terminal like this:

    docker-compose up -d
    Creating mysite.docker.amazee.io

    docker exec -itu drupal mysite.docker.amazee.io bash
    🔨 drupal@mysite.docker.amazee.io:~/public_html (dev)$

Please make sure that this `public_html` directory is the same where your Drupal lives in, so where the `index.php` file is:

    ll index.php
    -rw-r--r-- 1 501 dialout 549 Apr 26 06:11 index.php


Important for [Drupal Composer Project Users](https://github.com/drupal-composer/drupal-project):  
You will not see an `index.php` file here, instead you will see a `web` folder (or a similar folder) and a `composer.json` file. Plus when you run `drush` later, first change into the directory where the Drupal `index.php` file is (most probably just via `cd web`)

### Step 3: settings.php and drushrc.php

amazee.io has a unique environment variable system, which will tell your Drupal all about the environment it is in, like where to find the Database, how to connect to it.  
This has two main advantages:
1. There are no passwords or usernames at all saved in settings.php files, so you safely share your whole Drupal Code, without being worried, that somebody know credentials about your site.
2. The settings.php is the exact same one, no matter if the Drupal is running on your Local Docker, on the development or production site.

Following you find a very basic example to configure the connection to the database. Just add that at the bottom of existing `settings.php` from Drupal.

```
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

We do not suggest to just use this simple configuration for production sites, but for now, it's all good. See [Drupal Configuration and settings.php](../drupal/settingsphpfiles.md) for the whole magic of amazee.io settings.php files.

In order to teach Drush about our amazee.io environment, create a new file named `drushrc.php` inside a folder named `drush` inside the root directory of your Git repository:

```
<?php
if (getenv('AMAZEEIO_BASE_URL')) {
  $options['uri'] = getenv('AMAZEEIO_BASE_URL');
}
```

There are actually more Drush files available, read more in our [Drush Configuration Files](../drupal/drush-configuration-files.md) section about it. But for now this is all you need.

### Step 4: Test connection to the database

It's time to test! Easiest is that done with Drush, it will tell you some information about your site:

    🔨  drupal@mysite.docker.amazee.io:~/public_html (dev)$ drush status

    Drupal version         :  8.0.6
    Site URI               :  http://mysite.docker.amazee.io
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

Your output may look a slightly bit different than this one. Here are the things you should see.

The database connection:

    Database hostname      :  127.0.0.1
    Database port          :  3306
    Database username      :  drupal
    Database name          :  drupal


### Step 5: Install Drupal

It's time to install Drupal and test the site in your browser! Again best and easiest done via Drush, this time via `drush site-install`

    🔨 drupal@mysite.docker.amazee.io:~/public_html (dev)$ drush site-install

    You are about to DROP all tables in your 'drupal' database. Do you want to continue? (y/n): y

    Starting Drupal installation. This takes a while. Consider using the --notify global option.
    sh: 1: /usr/sbin/sendmail: not found
    Installation complete.  User name: admin  User password: rWYwHTxCK4
    Unable to send email. Contact the site administrator if the problem persists.
    Congratulations, you installed Drupal!

That's it! Now visit the URL you defined for you Docker Container in your browser and you should see a fresh installed Drupal Site. In this example, this is `http://mysite.docker.amazee.io`

Congratulations! You just created your first amazee.io Drupal Site!

![Congratulations](congratulations.gif)

## Add existing database

You may have an already existing Drupal database you would like to import into your Docker Container. Of course, we support that.

### Step 1: Get a database dump

This step depends on how you currently host. There are a lot of different ways on how to create a database dump.  
If your current hosting provider has Drush installed, you can use something like that:

    drush sql-dump --result-file=dump.sql

    Database dump saved to dump.sql

Now you have a `dump.sql` file that contains your whole database.

### Step 2: Add dump.sql file to the container

As the Docker Container has automatically access to your whole Drupal code, you can just place the dump inside your Drupal directory:

    ll dump.sql
    -rw-r--r-- 1 501 dialout 3098963 May  1 14:44 dump.sql

### Step 3: Import database from dump

Again drush, this time `drush sql-connect`, the backticks are important!

    `drush sql-connect` < dump.sql

You can verify that it worked with:

    drush sql-query "show tables;"

    batch
    block_content
    block_content__body
    block_content_field_data
    block_content_field_revision
    block_content_revision
    block_content_revision__body
    cache_bootstrap
    cache_config
    cache_container
    ... (a lot more here)

That's it! It might be clever to clear all caches via `drush cr` for Drupal 8 or `drush cc all` for Drupal 7.

Enjoy your Drupal site!

## Add existing files

As learned during the import of the DB, the Drupal directory is completely available inside the Docker Container.  
So to add your Drupal files, just put them in the directory you had them before, probably `sites/default/files`.

## Done!

Congrats to you again! You have now a full local Drupal Hosting environment at your fingertips. We wish happy drupaling.

Btw: Pushing your site to an amazee.io server is as easy as just a git push.

