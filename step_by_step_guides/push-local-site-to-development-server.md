# Push local site to development server

So you have your Drupal Site locally running with following the [Step-by-Step guide](/step_by_step_guides/get_your_drupal_site_running_on_amazeeio.md) and would like now to push it to an amazee.io development server? Then you are correct here!

Before we can do the first push, we need to configure some more things, no worries, they are all very straight forward to use.

## Step 0: Setup of development server

We need to set you up with the required things first. We are working hard to fully automate this step and make it as easy as everything else within amazee.io, but for now we need to know from you:

1. SSH-Public Keys of everybody that should get access to the development server
2. The URL of the Git repository which will host the Drupal Code
3. The Git branch you would like to use as your development server \(in this example we will use `develop`, but it realy can be any name!\)
4. Give our deployment systems access to the Git repository \(see [Grant access to your sourcecode](/step_by_step_guides/grant_amazeeio_access_to_sourcecode.md) on how to do that\)

That's it! You can actually continue with Steps 1-3 even though we

## Step 1: Use full fledged settings.php files

During the Step-by-Step process we just added some lines to your existing settings.php file. Even though this works great, we suggest to use our provided settings.php examples. Find them [here](/drupal/settingsphpfiles.md).

If you don't have existing custom settings in your settings.php file, it's perfectly fine to overwrite an existing settings.php file with the provided one from us. If there are settings already, we suggest to move them either to `all.settings.php` \(if you need them on development and production sites\) or to `development.settings.php` or to `production.settings.php` \(depending where you need them\).

After adapting the settings.php files, test that your Local Drupal site still works, the Docker based environment fully understands the multi settings.php files.

## Step 2: Extended Drush Configuration Files

We will use Drush later to synchronize our sites, but we need to tell Drush about our remote sites first.

This happens with a file called `aliases.drushrc.php` which needs to be placed inside a folder called `drush` in your root folder of your git repository.

You can find the file here: [https:\/\/github.com\/amazeeio\/drupal-setting-files\/blob\/master\/Drupal8\/drush\/aliases.drushrc.php](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal8/drush/aliases.drushrc.php) \(it's the same for Drupal 6, 7 or 8\).

While you are on it, we also suggest to adapt the `drushrc.php` file you probably during the step-by-step guide. Please replace the content of it with these: [https:\/\/github.com\/amazeeio\/drupal-setting-files\/blob\/master\/Drupal8\/drush\/drushrc.php](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal8/drush/drushrc.php) \(it's the same for Drupal 6, 7 or 8\).

## Step 3: Create .amazeeio.yml file and adapt `sitegroup`

The .amazeeio.yml file tells the amazee.io systems about deployment tasks and more. These tasks are super powerfull and allow to automate almost everything you can imagine. You can find more about them at [.amazeeio.yml file](/drupal/amazeeioyml_file.md). As it takes a bit time to figure out all the possibilities, we suggest to just use these files as a start, they will clear the cache and run db-update on every deployment.

Drupal 7: [https:\/\/github.com\/amazeeio\/drupal-setting-files\/blob\/master\/Drupal7\/.amazeeio.yml](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal7/.amazeeio.yml)

Drupal 8: [https:\/\/github.com\/amazeeio\/drupal-setting-files\/blob\/master\/Drupal8\/.amazeeio.yml](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal8/.amazeeio.yml)

The .amazeeio.yml file needs to be placed in the root directory of your git repository.

Please adapt the `sitegroup` in that yml file to the one you got from the amazee.io team.

## Step 4: Let's test!

Now it's time for testing: run drush site-alias inside your docker container and it should show you additional site aliases beside of `@none`, `@self` and `default`

```
🐳 drupal@mysite.docker.amazee.io:~/public_html (dev)$ drush site-alias
@none
@develop
@self
default
```

See the `@develop` site alias. This is the site alias of your development site were the `develop` branch is deployed to (or the branch name you told us to use in Step 0).



