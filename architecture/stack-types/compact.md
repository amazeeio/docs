# Compact Stack

The compact stack (sometimes also referred as single stack) is tailored for single-server environments and contains all services in one instance.

![Schematic overview compact stack](compact.png)


**All services are running in one instance:**

* Webserver: Nginx (Frontend and Backend)
* Frontend Caching: Varnish  
* FastCGI Process Manager: PHP-FPM with either PHP 5.6 or PHP 7.0
* Database: MariaDB
* Search: Apache Solr
