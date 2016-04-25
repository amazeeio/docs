# Single

Our Single Stack consists of 3 Servers:
This setup enables us to use specialized hardware configurations for certain workloads. For example the Database server can be tailored to use SSD storage.

### Frontend server
* frontend nginx
* varnish
### Backend server 
This is where Drupal is running
* backend nginx
* PHP-FPM


###Database / Caching / Search:
* Database MariaDB
* Redis
* Solr
