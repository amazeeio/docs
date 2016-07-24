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
    └── <linked_files and linked_directories>
```

##### Folders

* `public_html` is a symlink pointing to the latest release. This symlink is updated after the `before_deploy` tasks are executed. If the deployment fails before or during execution of `before_deploy` tasks the  symlink is not touched and still points to the old release.
* `releases` holds all deployments in a timestamped folder. These folders are the target of the current symlink. We keep 3 release folders present, the older folders get deleted after a successful deployment
* `repo` holds a checkout of the configured git repository.
* `shared` contains directories which are symlinked into each release. This data persists across deployments and releases. It is used for things like the Drupal files directory.

##### Task execution order

1. The git repo inside `repo` is checked out to the desired git branch


## On development sites
As we don't need the rollback capability on development sites we simply run a git-pull for the configured branch and run the deployment tasks afterwards.
