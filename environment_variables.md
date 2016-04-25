# Environment variables

Amazee.io exposes services to the webapplication by making use of environment variables.

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



```
### AMAZEE.IO Database connection
if(getenv('AMAZEEIO_SITENAME')){
  $databases['default']['default'] = array(
    'driver' => 'mysql',
    'database' => getenv('AMAZEEIO_SITENAME'),
    'username' => getenv('AMAZEEIO_DB_USERNAME'),
    'password' => getenv('AMAZEEIO_DB_PASSWORD'),
    'host' => getenv('AMAZEEIO_DB_HOST'),
    'port' => getenv('AMAZEEIO_DB_PORT'),
    'prefix' => '',
  );

```