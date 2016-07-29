# Synchronize Sites

amazee.io leverages [Drush](http://www.drush.org/) and [Drush Aliases](http://docs.drush.org/en/master/shellaliases/?highlight=alias) to run site synchronizations. You need the `aliases.drushrc.php` file correctly placed in order for site synchronizations to work, see [Drush Configuration Files](./drush_configuration_files.md)

## Synchronizing Databases

```
dsql @<site>
```
This command synchronizes the Database from the given site to the site you're currently logged in.

Examples:

* Running `dsql @prod` inside the local Docker Container will synchronize the database from the `prod` site into the local Docker database
* 


```
dfiles @<environment>
```

This command synchronizes the file directory of Drupal to your current environment. Please make sure you have the Database set up correctly before running this command. If the database is not present the discovery of the correct file directory can fail.

{% hint style='info' %}
`dfiles` and `dsql` are just  aliases for drush sql-sync or drush rsync. As we had the issues in the past that people mixed up environments and synchronized the wrong way we free you of remembering a long command by adding short versions of it, nice isn't it?
{% endhint %}
