# Deployments

## Deployment on production sites

The deployment strategy used at amazee.io is heavily inspired by capistrano. In the end they all do the same thing.

## Filesystem Structure

```
├── public_html -> /var/www/site_name/releases/20160607095555Z/
├── releases
│   ├── 20160612075028Z
│   ├── 20160607095540Z
│   ├── 20160607095542Z
│   └── 20160607095555Z
├── repo
│   └── <VCS related data>
└── shared
    └── <linked_files and linked_directories>
```

### Folders

- `public_html` is a symlink pointing to the latest release. This symlink is updated at the end of a successful deployment. If the deployment fails in any step the current symlink still points to the old release.

- `releases` holds all deployments in a timestamped folder. These folders are the target of the current symlink. We keep 3 release folders present, the older folders get deleted after a successful deployment

- `repo` holds a checkout of the configured git repository.

- `shared` contains the linked_files and linked_directories which are symlinked into each release. This data persists across deployments and releases. It should be used for things like database configuration files and static and persistent user storage handed over from one release to the next.

## Deployment on development sites
As we don't need the rollback capability on development sites we simply run a git-pull for the configured branch and run the deployment tasks afterwards.
