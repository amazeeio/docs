# Single

Our Single Stack consists of 3 Servers. This setup enables us to use specialized hardware configurations for certain workloads. For example the Database server can be tailored to use SSD storage and have more Memory than the internet facing servers.

### Frontend server
* Frontend Nginx  
The frontend Nginx server takes care of SSL Termination and Redirects
* Varnish  
Content which can be cached is cached in memory by Varnish

### Backend server
This is where Drupal is running

* Backend Nginx
* PHP-FPM


###Database / Caching / Search:
* Database MariaDB
* Redis
* Solr
