# Synchronize Sites
Amazee.io tightly integrates with [Drush](http://www.drush.org/) and [Drush Aliases](http://docs.drush.org/en/master/shellaliases/?highlight=alias). Therefore, you can use drush to sync between environments, amazee.io knows about your site environments and will automatically add them as you add a new site (e.g. a staging environment) to your account.


```
dsql @<environment>
```
This command synchronizes the Database from the mentioned environment to the environment you're currently logged in.


```
dfiles @<environment>
```

This command synchronizes the file directory of Drupal to your current environment. Please make sure you have the Database set up correctly before running this command. If the database is not present the discovery of the correct file directory can fail.
