# Push local site to development server

So you have your Drupal Site locally running with following the [Step-by-Step guide](/step_by_step_guides/get_your_drupal_site_running_on_amazeeio.md) and would like now to push it to an amazee.io development server? Then you are correct here!

Before we can do the first push, we need to configure some more things, no worries, they are all very straight forward to use.

## Step 1: Use full flegged settings.php files

During the Step-by-Step process we just added some lines to your existing settings.php file. Even though this works great, we suggest to use our provided settings.php examples. Find them [here](/drupal/settingsphpfiles.md).

If you don't have existing custom settings in your settings.php file, it's perfectly fine to overwrite an existing settings.php file with the provided one from us. If there are settings already, we suggest to move them either to `all.settings.php` (if you need them on development and production sites) or to `development.settings.php` or to `production.settings.php` (depending where you need them).

