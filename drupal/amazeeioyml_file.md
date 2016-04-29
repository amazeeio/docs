# .amazeeio.yml file

The Deployment checks if a .amazeeio.yml file is present. This file is used for running tasks during an actual deployment.

```
deploy_tasks:
  development:
    before_deploy:
      - npm install
      - npm run gulp -- compile
    after_deploy:
      - drush -y updb --cache-clear=0
      - drush -y cr
  production:
    before_deploy:
      - npm install
      - npm run gulp -- build
      - rm -rf node_modules
    after_deploy:
      - drush -y updb --cache-clear=0
      - drush -y cr
shared:
  production:
    - src: files
      dst: sites/default/files

```

Example for a D8 .amazeeio.yml file
