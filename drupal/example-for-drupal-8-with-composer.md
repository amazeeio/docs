# `.amazeeio.yml` Example for Drupal 8 with Composer

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
shared:
 production:
 - src: files
 dst: web/sites/default/files
versions:
 node: 4
```