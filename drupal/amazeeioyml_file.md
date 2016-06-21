# .amazeeio.yml file

The automated deployment checks if a `.amazeeio.yml` file is present. This file is used to run tasks during the process of the deployment.

For a Drupal 8 Deployment with npm the `.amazeeio.yml` file could look like following:

```
deploy_tasks:
  development:
    before_deploy:
      - npm run gulp -- compile
    after_deploy:
      - drush -y updb --cache-clear=0
      - drush -y cr
  production:
    before_deploy:
      - npm install
      - npm run gulp -- build
    after_deploy:
      - drush -y updb --cache-clear=0
      - drush -y cr
  branch_deploy_tasks:
    testbranch:
      before_deploy:
        - drush -y sql-drop 2>&1
        - drush -y sql-sync @prod default 2>&1
        - drush -y rsync @prod:%files default:%files 2>&1
      after_deploy:
        - drush -y updb --cache-clear=0
        - drush -y cr
shared:
  production:
    - src: files
      dst: sites/default/files
```

### deploy_tasks  → development / deploy_tasks → production
Defines the tasks which are run in the different sites with their respective [environment type](environment_type.md).

### before_deploy
Tasks which are ran before the release is going to be activated on the server

### after_deploy:
Tasks which are ran after the releease is activated on the server

### deploy_tasks → branch_deploy_tasks
If you have several sites and need to run a different set of tasks you can make us of `branch_deploy_tasks` which will then be run on those specific branches. The shown example would run following commands on deployment of the git branch `testbranch`:

  - Dropping the SQL Database
  - Synchronize production Database to testbranch site
  - Synchronize production files to testbranch site

You can make use of before_deploy and after_deploy tasks also within the branch_deploy_tasks.

### shared
The shared part of the configuration file will be used to symlink shared resources (e.g. files or other directoies which need to be present on all backend webservers).
