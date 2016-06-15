# .amazeeio.yml file

The automated deployment checks if a `.amazeeio.yml` file is present. This file is used to run tasks during the process of the deployment.

For a Drupal 8 Deployment with npm the file could look like following:
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
shared:
  production:
    - src: files
      dst: sites/default/files
```

### development / production
Defines the tasks which are run in the different different environments (see Envoronments)

### before_deploy
Tasks which are ran before the release is going to be activated on the server

### after_deploy:
Tasks which are ran after the releease is activated on the server

### shared
The shared part of the configuration file will be used to symlink shared resources (e.g. files or other directoies which need to be present on all backend webservers).
