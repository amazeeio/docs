```
sitegroup: mysitegroup
deploy_tasks:
 development:
 before_deploy:
 - composer install
 - npm install
 - npm run gulp -- compile
 after_deploy:
 - cd web && drush -y updb --cache-clear=0
 - cd web && drush -y cr
 production:
 before_deploy:
 - composer install
 - npm install
 - npm run gulp -- build
 after_deploy:
 - cd web && drush -y updb --cache-clear=0
 - cd web && drush -y cr
branch_deploy_tasks:
 testbranch:
 before_deploy:
 - composer install
 - npm install
 - npm run gulp -- build
 after_deploy:
 - cd web && drush -y sql-drop 2>&1
 - cd web && drush -y sql-sync @prod default 2>&1
 - cd web && drush -y rsync @prod:%files default:%files 2>&1
 - cd web && drush -y updb --cache-clear=0
 - cd web && drush -y cr
shared:
 production:
 - src: files
 dst: web/sites/default/files
versions:
 node: 4
```