# Compact Stack

The compact stack (sometimes also referred as single stack) is tailored for single-server environments and contains all services on one server.

![Schematic overview compact stack](compact.png)


**All services are running on the same server:**

* Webserver: Nginx (Frontend and Backend)
* Frontend Caching: Varnish  
* FastCGI Process Manager: PHP-FPM
* Database MariaDB
* Search Apache Solr
