# Automatic synchronization of sites

With the capabilites of defining [branch specific tasks](../amazeeioyml_file.md) we can create specific tasks for a deployment during a single branch.

One of the possible applications of these branch specific tasks is to synchronize a site's database fully automatically during a deployment:

```
branch_deploy_tasks:
  testbranch:
   before_deploy:
 - composer install
 after_deploy:
 - cd web && drush -y sql-drop 2>&1
 - cd web && drush -y sql-sync @prod default 2>&1
 - cd web && drush -y rsync @prod:%files default:%files 2>&1
 - cd web && drush -y updb --cache-clear=0
 - cd web && drush -y cr
```