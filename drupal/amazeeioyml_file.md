# .amazeeio.yml file

To ensure a perfect system and tell the deployment system what it should do doring a deployment, your Git repository requires an `.amazeeio.yml` file to be present. It is written in YAML and needs to be in the root directory of the Git Repository.

The most minimal file looks at follows:

```
sitegroup: mysitegroup
```

`sitegroup` is the only required key that needs to be present, all other keys are optional, but provide a lot of power. For a Drupal 8 with composer site and npm as frontend build system the `.amazeeio.yml` file could look like following: (see more examples as subpages)

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

## Explanation of keys

### `sitegroup` (required)
Defines the name of the site group this Git repository is in. You receive this sitegroup whenever you create a new sitegroup. 

### `deploy_tasks` (optional)
Group for all tasks that are automatically run during a deployment, unless there are branch specific tasks defined.

#### `deploy_tasks.development.before_deploy`
List of single tasks that are run as a **first** step during a deployment to a site marked with the environment type [development](../environment_type.md). See [steps during a development deployment](../automated_deployments.md). Example:

```
deploy_tasks:
  development:
    before_deploy:
      - npm run gulp -- compile
```

#### `deploy_tasks.development.after_deploy`
List of single tasks that are run as a **second** step during a deployment to a site marked with the environment type [development](../environment_type.md). See [steps during a development deployment](../automated_deployments.md).

```
deploy_tasks:
  development:
    after_deploy:
      - cd web && drush -y updb --cache-clear=0
```

#### `deploy_tasks.production.before_deploy`
List of single tasks that are run **before** the releases folder gets public during a deployment to a site marked with the environment type [production](../environment_type.md). These tasks are run inside the `releases` directory for this release. No commands doing database changes should be executed here. See [steps during a production deployment](../automated_deployments.md).

```
deploy_tasks:
  production:
    before_deploy:
      - composer install
```

#### `deploy_tasks.production.after_deploy`
List of single tasks that are run as **after** the releases folder is public to a site marked with the environment type [production](../environment_type.md). These tasks are run inside the `publich_html` directory. Commands doing database changes should be ran here. Failed commands will trigger a rollback of this deployment. See [steps during a production deployment](../automated_deployments.md).

```
deploy_tasks:
  production:
    after_deploy:
      - cd web && drush -y cr
```

### `branch_deploy_tasks` (optional)

Group for tasks specifically to a branch. If defined, they run **instead** of the defined tasks within `deploy_tasks`.

The structure is exactly the same as `deploy_tasks`, just with the defined branch name as key instead of the environment type, example:

```
branch_deploy_tasks:
  testbranch:
    after_deploy:
      - cd web && drush -y sql-drop 2>&1
```

See the page [Automatic Synchronization of Sites - Continous Integration](./automatic-synchronization-of-sites.md) for a real live example on using branch deploy tasks.

### `shared` (optional)
*Applies only to sites marked as type production, as type development sites do not use symlinked and releases folders.*

List of files or directories that should be symlinked from the `shared` directory inside the home directory, into the `public_html` directory. (the `shared` directory is synchronized across all backend servers in a [cluster stack](../architecture/stack-types/cluster.md)).

Each element in this list requires two keys:

- `src` - the source directory or file within `shared` that should be symlinked. Need to exist of the deployment will fail and be stopped.
- `dst` - the destination directory or file where the symlink to `src` should be created. If already existing the deployment will be failed and stopped (to prevent data loss).

Example:

```
shared:
  production:
    - src: files
      dst: web/sites/default/files
```

This example will create a symlink that is as follows:
```
~/public_html/web/sites/default/files -> ~/shared/files
```

### `versions` (optional)

Defines installation and usage of software or tools on the CLI. (the PHP Version is defined during setup of the site and not in the `.amazeeio.yml` file.

#### `versions.node`

Defines the version number of Node.js that should automatically be installed and used. Can be defined as either just a major version number like `4` or specific versions like `6.3.0`. We're using `nvm` to handle the different nodejs versions, please check with nvm which versions do apply.

If defined, every connection via SSH to a site or deployment tasks will have the defined version of nodejs first installed and all nodejs specific commands are ran with that version (like `node` or `npm`).

If no versions of node is defined, the default of amazee.io (newest LTS version) is used.

Example:
```
versions:
  node: 4
```
This will install the newest available minor version 4 of Node.js.

## Examples

Please see the examples for different Drupal Versions and other ideas as subpages.

If you have several sites and need to run a different set of tasks you can make us of `branch_deploy_tasks` which will then be run on those specific branches. The shown example would run following commands on deployment of the git branch `testbranch`:

  - Dropping the SQL Database
  - Synchronize production Database to testbranch site
  - Synchronize production files to testbranch site

You can make use of before_deploy and after_deploy tasks also within the branch_deploy_tasks.
