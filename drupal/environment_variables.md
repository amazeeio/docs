# Environment Variables

Amazee.io exposes services to the web application by making use of environment variables.

| Variable   | Content  | Feature  |
|---|---|---|
| AMAZEEIO_SITENAME  |   | Site  |
| AMAZEEIO_DB_USERNAME |   |  Database |
| AMAZEEIO_DB_PASSWORD  |   |   Database|
| AMAZEEIO_DB_HOST  |   |   Database|
| AMAZEEIO_DB_PORT  |   |   Database|
|   |   |   Solr |
|   |   |   Redis |
|   |   |   Varnish |
|   |   |   |
|   |   |   |

Environment variables can be access from your web application by using PHP's `getenv()` function.
```
$database_username = getenv('AMAZEEIO_DB_USERNAME');
```
For more information about the configuration of Drupal please see: 