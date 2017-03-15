# Drush Configuration Files

Both of these files, should be placed within a `drush` folder inside the root directory of the Git repository.

See https://github.com/amazeeio/drupal-setting-files for more examples.

## Drush RC File `drush/drushrc.php`

In order for Drush to understand the URL of he current site, Drush searches for a file with the name `drushrc.php`. Knowing the URL of the current site ensures that cronjobs or other commands are running with the correct URL.

```
<?php
if (getenv('AMAZEEIO_BASE_URL')) {
$options['uri'] = getenv('AMAZEEIO_BASE_URL');
}
```

See https://github.com/amazeeio/drupal-setting-files for more interesting things that can be put into the `drushrc.php` file.

## Drush Aliases File `drush/aliases.drushrc.php`

In order for Drush to connect to remote sites and perform synchronizations and other commands, it needs a small file that connects Drush to the amazee.io API.

```
<?php
// Don't change anything here, it's magic!
global $aliases_stub;
if (empty($aliases_stub)) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_AUTOREFERER, TRUE);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_URL, 'https://drush-alias.amazeeio.cloud/aliases.drushrc.php.stub');
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
    $aliases_stub = curl_exec($ch);
    curl_close($ch);
}
eval($aliases_stub);
```

This small script will download the current API connection script from our servers and execute it. The script itself will search for an `.amazeeio.yml` file, extract the sitegroup name from it and query the amazee.io API for the information about the existing sites for this sitegroup.
