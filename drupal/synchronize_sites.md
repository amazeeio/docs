# Synchronize Sites

amazee.io leverages [Drush](http://www.drush.org/) and [Drush Aliases](http://docs.drush.org/en/master/shellaliases/?highlight=alias) to run site synchronizations. You need the `aliases.drushrc.php` file correctly placed in order for site synchronizations to work, see [Drush Configuration Files](./drush_configuration_files.md)

## Synchronizing Databases

```
dsql @<site>
```
This command synchronizes the Database from the given site to the site you're running the command from.

###### Examples

* `dsql @prod` inside the local Docker Container: Synchronizes the database from the `prod` site into the local Docker database
* `dsql @staging` while connected via SSH to the `develop` site: Synchronizes the database from the `staging` site into the database on the `develop` site.

###### Remarks

`dsql` is actually a Bash alias for `drush sql-sync $1 default -d -v`

{% hint style='info' %}
We suggest though to use `dsql` in stead of `drush sql-sync`, as there is a danger to switch the source and destination of the command and with that synchronize in the wrong direction and overwride a production database!.
{% endhint %}


## Synchronizing Files

```
dfiles @<environment>
```

This command synchronizes the file directory from the given site to the files directory of the site you're running the command from. This command needs a Drupal site correctly running, as it needs to bootstrap Drupal in order to discover the location of the files directory.

{% hint style='info' %}
`dfiles` and `dsql` are just  aliases for drush sql-sync or drush rsync. As we had the issues in the past that people mixed up environments and synchronized the wrong way we free you of remembering a long command by adding short versions of it, nice isn't it?
{% endhint %}
