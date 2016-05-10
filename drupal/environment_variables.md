# Environment Variables

Amazee.io exposes services to the web application by making use of environment variables.

| Variable                  | Content                                       | Component |
|---------------------------|-----------------------------------------------|-----------|
| AMAZEEIO_BASE_URL         | Generated Base URL                            | Drupal    |
| AMAZEEIO_DB_HOST          | Database Hostname                             | Database  |
| AMAZEEIO_DB_PASSWORD      | Database Password                             | Database  |
| AMAZEEIO_DB_PORT          | Database Port                                 | Database  |
| AMAZEEIO_DB_USERNAME      | Database Username                             | Database  |
| AMAZEEIO_HOSTINGSTACK     | The stack identifier you are running on       | System    |
| AMAZEEIO_LOCATION         | System Location (used for debugging purposes) | System    |
| AMAZEEIO_SITE_BRANCH      | The branch configured for your site           | System    |
| AMAZEEIO_SITE_ENVIRONMENT | Environment (production / development)        | System    |
| AMAZEEIO_SITE_NAME        | Sitename / Username of the Site               | System    |
| AMAZEEIO_SOLR_HOST        | Solr Host                                     | Solr      |
| AMAZEEIO_SOLR_PORT        | Solr Port                                     | Solr      |
| AMAZEEIO_VARNISH_HOSTS    | Varnish Hosts                                 | Varnish   |
| AMAZEEIO_VARNISH_SECRET   | Varnish Secret                                | Varnish   |

Environment variables can be access from your web application by using PHP's `getenv()` function.

```
$database_username = getenv('AMAZEEIO_DB_USERNAME');
```

For more information about the configuration of Drupal please see: [Settings.php Files](./settingsphpfiles.html)
