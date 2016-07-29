# Automatic synchronization of sites

With the capabilites of defining [branch specific tasks](../amazeeioyml_file.md) we can create specific tasks for a deployment during a single branch.

One of the possible applications of these branch specific tasks is to synchronize a site's database fully automatically during a deployment:

```
branch_deploy_tasks:
  preprod:
   before_deploy:
     - composer install
   after_deploy:
     - cd web && drush -y sql-drop
     - cd web && drush -y sql-sync @prod default
     - cd web && drush -y updb --cache-clear=0
     - cd web && drush -y cr
```

In this example on every deployment to the `preprod` branch, the regular defined `deploy_tasks` in the yaml file are ignored and instead the tasks defined here are called.

As during a deployment we have full access to a drush, we can also call commands that involve site aliases, like `sql-sync`.

* In this case the current existing database from the `preprod` site will be deleted (`drush sql-drop`).
* Then the database is synced from the site with the name `prod` (assuming this is the production site)