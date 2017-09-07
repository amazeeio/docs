# `.amazeeio.yml` Example for Drupal 8 with Composer

We recommend using following the instructions [here](https://github.com/amazeeio/drupal-project) to create your drupal project using composer install, which automatically gives you the file below.

If Drupal 8 is installed via composer, composer is in charge of downloading Drupal Core, Drupal Contrib and external libraries. See the `composer install` command as a first command for `development` and `production` sites in order to make sure that everything is correctly installed.

Additionally the Drupal directory is usually installed within a subfolder of the Git repository. Therefore Drush and other Drupal related bash commands need to executed within that subfolder. 

In this example, composer installs Drupal within a folder called `web`. See the `cd web` prefix for each command to ensure that drush is called in the right folder.

```
sitegroup: mysitegroup
deploy_tasks:
  development:
    before_deploy:
      - composer install
    after_deploy:
      - cd web && drush -y updb --cache-clear=0
      - cd web && drush -y cr
  production:
    before_deploy:
      - composer install
  after_deploy:
      - cd web && drush -y updb --cache-clear=0
      - cd web && drush -y cr
shared:
 production:
   - src: files
     dst: web/sites/default/files
```

Other important things to note:
* All drush commands are called with a `-y`, in order to ensure that no command is waiting for user input, which will not be possible during automated deployments. 
* Additionally this `-y` is added right after the `drush` command, as in some situations (like `drush rsync`) drush would pass the `-y` to the subcommand (like `rsync`) instead of interpreting it itself.
* `drush updb` is called with the parameter `--cache-clear=0` to ensure that there is no cache clear is called after the `drush updb` command has executed. This to prevent a double running of a cache clear in case that there was an update to apply. Also to ensure that we call a cache clear on every deployment, because just having `drush updb` as a command itself is not enough, as `drush updb` will only call a cache clear if there actually was an update to apply.
