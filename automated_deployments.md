# Deployments

## On production sites

The deployment strategy used at amazee.io is heavily inspired by capistrano.

##### Filesystem Structure

```
home directory (like /var/www/site_name)
├── public_html -> /var/www/site_name/releases/20160607095555Z/
├── releases
│   ├── 20160612075028Z
│   ├── 20160607095542Z
│   └── 20160607095555Z
├── repo
│   └── <GIT repo>
└── shared
    └── <shared directories>
```

###### Folders

* `public_html` is a symlink pointing to the latest release. This symlink is updated after the `before_deploy` tasks are executed. If the deployment fails before or during execution of `before_deploy` tasks the  symlink is not touched and still points to the old release.
* `releases` holds all deployments in a timestamped folder in UTC. These folders are the target of the current symlink. We keep 3 release folders present, the older folders get deleted after a successful deployment
* `repo` holds a checkout of the configured git repository.
* `shared` contains directories which are symlinked into each release. This data persists across deployments and releases. It is used for things like the Drupal files directory.

##### Task execution order

This shows the order of a production deployment. If on a cluster stack, these tasks are all executed simultaneously at the same time on all backends: 

1. The git repo inside `repo` is checked out to the desired git branch (basically a `git pull`)
2. The whole folder `repo` is copied into the `releases` folder, with the folder name of the current time in UTC.
3. The `before_deploy` tasks are executed inside the created folder. 
  * Important: `before_deploy` tasks should only be used for tasks that do not change anything on the Drupal Database and for tasks that need to be executed on all servers within a cluster. Some examples: `composer install`, `npm`
  * If any of these `before_deploy` tasks is failing (return code is not 0), the deployment is stopped immediately and the created directory for the failed deployment within the `releases` directory is removed.

4. The `public_html` symlink is switched to the new folder within `releases` 
  * This is refeered to the actual **deploy** to have happened (this why the tasks are called `before` and `after` deploy tasks)

5. The `after_deploy` are executed (If on cluster only on one backend).
  * Important: `after_deploy` tasks should be used for tasks that change database related things like `drush updb` or for tasks that should be executed only once in a cluster environment, like `drush cr`.
  * If any of the `after_deploy` tasks is failed  (return code is not 0), the rollback routine is called on all backends:
    1. The `public_html` symlink is changed back to the previous deployment.
    2. The `releases` folder of the failed deployment is removed.
    * **No tasks from the `before_deploy` or `after_deploy` task lists are executed**, as the state of the Drupal site is very hard to understand for the deployment system. In case of a rollbacked deployment, you should ensure yourself that the site is working properly.

## On development sites

Development sites do not need a complex deployment system and are therefore easier. Basically it's just a git pull directly on the `public_html` directory and deployment tasks executed.

##### Filesystem Structure

```
home directory (like /var/www/site_name)
└── public_html
```

###### Folders

* `public_html` is git checkout of the desired git branch

There are no additional directories, everything is within `public_html`

##### Task execution order

1. The git repository inside `public_html` is checked out to the desired git branch (basically a `git pull`)
2. The `before_deploy` tasks are executed inside the `public_html` folder.
 * If any of these `before_deploy` tasks is failing (return code is not 0), the deployment is stopped immediately and the created directory for the failed deployment within the `releases` directory is removed.

4. The `public_html` symlink is switched to the new folder within `releases`
 * This is refeered to the actual **deploy** to have happened (this why the tasks are called `before` and `after` deploy tasks)

5. The `after_deploy` are executed (If on cluster only on one backend).
 * Important: `after_deploy` tasks should be used for tasks that change database related things like `drush updb` or for tasks that should be executed only once in a cluster environment, like `drush cr`.
 * If any of the `after_deploy` tasks is failed (return code is not 0), the rollback routine is called on all backends:
 1. The `public_html` symlink is changed back to the previous deployment.
 2. The `releases` folder of the failed deployment is removed.
 * **No tasks from the `before_deploy` or `after_deploy` task lists are executed**, as the state of the Drupal site is very hard to understand for the deployment system. In case of a rollbacked deployment, you should ensure yourself that the site is working properly.