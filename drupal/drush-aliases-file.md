# Drush Configuration Files

Both of these files, should be placed within a `drush` folder inside the root directory of the Git repository.

See https://github.com/amazeeio/drupal-setting-files for examples.

## Drush Aliases File `aliases.drushrc.php`

In order for Drush to connect to remote sites and perform synchronizations and other commands, it needs a small file that connects Drush to the amazee.io API.

```
<?php
global $aliases_stub;
if (empty($aliases_stub)) { 
  $aliases_stub = file_get_contents('https://raw.githubusercontent.com/amazeeio/drush-aliases/master/aliases.drushrc.php.stub?' . rand(0, 99999999999));
}
eval($aliases_stub);
```

This small script will download the current API connection script from our GitHub repository and execute it. The script itself will search for an `.amazeeio.yml` file, extract the sitegroup name from it and query the amazee.io API for the information about the existing sites for this sitegroup.
