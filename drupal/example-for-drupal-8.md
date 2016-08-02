# `.amazeeio.yml` Example for Drupal 8 without Composer

If Drupal 8 is regularly installed, there are no special precautions to take in terms of subfolders for the Drupal itself.

```
sitegroup: mysitegroup
deploy_tasks:
  development:
    after_deploy:
      - drush -y updb --cache-clear=0
      - drush -y cr
  production:
    after_deploy:
      - drush -y updb --cache-clear=0
      - drush -y cr
shared:
  production:
    - src: files
      dst: sites/default/files
```

Other important things to note:
* All drush commands are called with a `-y`, in order to ensure that no command is waiting for user input, which will not be possible during automated deployments.
* Additionally this `-y` is added right after the `drush` command, as in some situations (like `drush rsync`) drush would pass the `-y` to the subcommand (like `rsync`) instead of interpreting it itself.
* `drush updb` is called with the parameter `--cache-clear=0` to ensure that there is no cache clear is called after the `drush updb` command has executed. This to prevent a double running of a cache clear in case that there was an update to apply. Also to ensure that we call a cache clear on every deployment, because just having `drush updb` as a command itself is not enough, as `drush updb` will only call a cache clear if there actually was an update to apply.