# .amazeeio.yml file

To ensure a perfect system and tell the deployment system what it should do doring a deployment, your Git repository requires an `.amazeeio.yml` file to be present. It is written in YAML and needs to be in the root directory of the Git Repository.

The most minimal file looks at follows:

```
sitegroup: mysitegroup
```

`sitegroup` is the only required key that needs to be present, all other keys are optional, but provide a lot of power.

For a Drupal 8 Deployment with npm the `.amazeeio.yml` file could look like following:

```
sitegroup: mysitegroup
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
versions:
  node: 4
```

## Explanation of keys

#### `sitegroup` (required)
Defines the name of the site group this Git repository is in. You receive this sitegroup whenever you create a new sitegroup. 

### `deploy_tasks` (optional)
Defines all tasks that are automatically run during a deployment. 

#### `deploy_tasks.development`
Defines all tasks that are run during a deployment to a site marked with the environment type [development](../environment_type.md).

#### `deploy_tasks.production`
Defines all tasks that are run during a deployment to a site marked with the environment type [production](../environment_type.md).

### before_deploy
Tasks which are ran before the release is going to be activated on the server

### after_deploy:
Tasks which are ran after the releease is activated on the server

### branch_deploy_tasks
If you have several sites and need to run a different set of tasks you can make us of `branch_deploy_tasks` which will then be run on those specific branches. The shown example would run following commands on deployment of the git branch `testbranch`:

  - Dropping the SQL Database
  - Synchronize production Database to testbranch site
  - Synchronize production files to testbranch site

You can make use of before_deploy and after_deploy tasks also within the branch_deploy_tasks.

### shared
The shared part of the configuration file will be used to symlink shared resources (e.g. files or other directoies which need to be present on all backend webservers).
