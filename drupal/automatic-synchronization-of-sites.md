# Automatic synchronization of sites - Continous Integration

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

* `drush -y sql-drop` - The current existing database from the `preprod` site will be deleted.
* `drush -y sql-sync @prod default` - The `preprod` database is synced from the site with the name `prod`

Now a possible change to the production site should be first merged into the `preprod` branch. The deployment will run through and applies the new code automatically to the existing production database, if any of the commands will fail (like `drush updb`, as the code has an module update which does not apply to the production site) you get informed about this error and can prevent a possible broken production website!

After the code has been deployed, you have full access to the site itself via the URL of the `preprod` site. You can test everything again and make sure that your changes really apply to the current production database.

When you are sure that everything is according to your likings, merge the code into the `prod` branch and be happy :)