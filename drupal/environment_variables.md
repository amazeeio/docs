# Environment Variables

Amazee.io exposes services to the web application by making use of environment variables.

| Variable | Content | Component |
| :--- | :--- | :--- |
| AMAZEEIO_BASE_URL | Database Hostname |  |
| AMAZEEIO\_DB\_HOST |  |  |
| AMAZEEIO\_DB\_PASSWORD | Database Password | Database |
| AMAZEEIO\_DB\_PORT | Database Port | Database |
| AMAZEEIO\_DB\_USERNAME | Database Username | Database |
| AMAZEEIO\_HOSTINGSTACK | The stack identifier you are running on | System |
| AMAZEEIO\_LOCATION | System Location \(used for debugging purposes\) | System |
| AMAZEEIO\_SITE\_BRANCH | The branch configured for your site | System |
| AMAZEEIO\_SITE\_ENVIRONMENT | Environment \(production \/ development\) | System |
| AMAZEEIO\_SITE\_NAME | Sitename \/ Username of the Site | System |
| AMAZEEIO\_TMP\_PATH | A per site path for temporary files | System |
| AMAZEEIO\_SOLR\_HOST | Solr Host | Solr |
| AMAZEEIO\_SOLR\_PORT | Solr Port | Solr |
| AMAZEEIO\_VARNISH\_HOSTS | Varnish Hosts | Varnish |
| AMAZEEIO\_VARNISH\_SECRET | Varnish Secret | Varnish |

Environment variables can be access from your web application by using PHP's `getenv()` function.

```
$database_username = getenv('AMAZEEIO_DB_USERNAME');
```

For more information about the configuration of Drupal please see: [Settings.php Files](./settingsphpfiles.html)

