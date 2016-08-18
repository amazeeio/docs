# Push local site to development server

So you have your Drupal Site locally running with following the [Step-by-Step guide](/step_by_step_guides/get_your_drupal_site_running_on_amazeeio.md) and would like now to push it to an amazee.io development server? Then you are correct here!

Before we can do the first push, we need to configure some more things, no worries, they are all very straight forward to use.

## Step 1: Use full flegged settings.php files

During the Step-by-Step process we just added some lines to your existing settings.php file. Even though this works great, we suggest to use our provided settings.php examples. Find them [here](/drupal/settingsphpfiles.md).

If you don't have existing custom settings in your settings.php file, it's perfectly fine to overwrite an existing settings.php file with the provided one from us. If there are settings already, we suggest to move them either to `all.settings.php` \(if you need them on development and production sites\) or to `development.settings.php` or to `production.settings.php` \(depending where you need them\).

After adapting the settings.php files, test that your Local Drupal site still works, the Docker based environment fully understands the multi settings.php files.

## Step 2: Create .amazeeio.yml file

The .amazeeio.yml file tells the amazee.io systems about deployment tasks and more. These tasks are super powerfull and allow to automate almost everything you can imagine. You can find more about them at [.amazeeio.yml file](/drupal/amazeeioyml_file.md). As it takes a bit time to figure out all the possibilities, we suggest to just use these files as a start:

Drupal 7: [https:\/\/github.com\/amazeeio\/drupal-setting-files\/blob\/master\/Drupal7\/.amazeeio.yml](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal7/.amazeeio.yml)

Drupal 8: [https:\/\/github.com\/amazeeio\/drupal-setting-files\/blob\/master\/Drupal8\/.amazeeio.yml](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal8/.amazeeio.yml)

The .amazeeio.yml file needs to be placed in the root directory of your git repository.

## Step 3: Extended Drush Configuration Files



