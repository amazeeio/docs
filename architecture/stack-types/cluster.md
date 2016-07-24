# Cluster Stack

The biggest and most reliable setup you can host your site on is our Cluster Stack. It consists of several orchestrated instances and is designed for high reliability and can serve high traffic sites with ease. Every component is individually scaled to optimize the infrastructure to the current traffic levels.

![Schematic overview Cluster stack](cluster.png)

### Frontend Server

* **Frontend Nginx:** The frontend Nginx server takes care of SSL Termination and Redirects
* **Varnish:** Content which can be cached is cached in memory by Varnish

### Backend servers

* **Backend Nginx:**
The second Nginx instance takes care of running the actual drupal site. PHP requests are passed to PHP-FPM.
* **FastCGI Process Manager:** PHP-FPM with either PHP 5.6 or PHP 7.0
* **Maxscale Database Proxy:** Connects to the correct MariaDB Server within the Galera Cluster


###Database

* **MariaDB Galera Cluster**

### Search

* **Apache Solr**

###Filestorage

* **NFS File Server**
