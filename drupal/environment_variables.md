# Environment Variables

Amazee.io exposes services to the web application by making use of environment variables.

| Variable                  | Content            | Component |
|---------------------------|--------------------|-----------|
| AMAZEEIO_BASE_URL         | Generated Base URL | Drupal    |
| AMAZEEIO_DB_HOST          | Database Hostname  | Database  |
| AMAZEEIO_DB_PASSWORD      | Database Password  | Database  |
| AMAZEEIO_DB_PORT          | Database Port      | Database  |
| AMAZEEIO_DB_USERNAME      | Database Username  | Database  |
| AMAZEEIO_HOSTINGSTACK     |                    | System    |
| AMAZEEIO_LOCATION         |                    | System    |
| AMAZEEIO_REDIS_HOST       | Redis Host         | Redis     |
| AMAZEEIO_REDIS_PORT       | Redis Port         | Redis     |
| AMAZEEIO_SITE_BRANCH      |                    | System    |
| AMAZEEIO_SITE_ENVIRONMENT |                    | System    |
| AMAZEEIO_SITE_NAME        |                    |System|
| AMAZEEIO_SITE_URL         |                    |System|
| AMAZEEIO_SITEBRANCH       |                    |System|
| AMAZEEIO_SITENAME         |                    |System|
| AMAZEEIO_SOLR_HOST        | Solr Host          | Solr      |
| AMAZEEIO_SOLR_PORT        | Solr Port          | Solr      |
| AMAZEEIO_VARNISH_HOSTS    |                    | Varnish   |
| AMAZEEIO_VARNISH_SECRET   |                    | Varnish   |


Environment variables can be access from your web application by using PHP's `getenv()` function.
```
$database_username = getenv('AMAZEEIO_DB_USERNAME');
```
For more information about the configuration of Drupal please see: [Settings.php Files](./settings_php_files)
