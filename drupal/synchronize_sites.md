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

{% hint style='info' %}
`drush sql-sync` and also `dsql` will not remove a possible existing database on the target site. Already existing tables will be completely overwritten though if they exist on the source database. Existing tables on the target database, which do not exist on the source database, will still exist and can cause issues (like when enabling a new module that will not install because a new table already exists). In order to have an exact copy of a source database on the target database, run `drush sql-drop` first and then `dsql`.
{% endhint %}

## Synchronizing Files

```
dfiles @<environment>
```

This command synchronizes the file directory from the given site to the files directory of the site you're running the command from. This command needs a Drupal site correctly running, as it needs to bootstrap Drupal in order to discover the location of the files directory.

###### Examples

* `dfiles @prod` inside the local Docker Container: Synchronizes the files directory from the `prod` site into the local files directory.
* `dfiles @staging` while connected via SSH to the `develop` site: Synchronizes the files directory from the `staging` site into the files directory on the `develop` site.

###### Remarks

`dfiles` is actually a Bash alias for `drush rsync $1:%files default:%files -d -v`

{% hint style='info' %}
We suggest though to use `dfiles` in stead of `drush rsync`, as there is a danger to switch the source and destination of the command and with that synchronize in the wrong direction and overwride production files!.
{% endhint %}

{% hint style='info' %}
`drush rsync` and also `dfiles` will not remove already existing files on the target files directory. Already existing files will be overwritten though. Please see https://drushcommands.com/drush-8x/rsync to learn more about additional parameters for `drush rsync`
{% endhint %}
