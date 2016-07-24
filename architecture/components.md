# System Components

Our stack is built was built from scratch with performance, security and reliability in mind. This page covers the main components of the amazee.io stack.

<!-- toc -->

## Operating System: Ubuntu

Our servers are set up using the latest [LTS (Long Term Support)](https://wiki.ubuntu.com/LTS) Version of [Ubuntu](http://www.ubuntu.com/server). This ensures stability and security as the LTS versions are supported for up to 5 years.

## Webserver: Nginx

Every browser request needs to be forwarded to PHP and Drupal. amazee.io uses the industry-standard, super-fast webserver [NGINX](http://nginx.org/); not only for PHP but also for HTTPS offloading. Should you require a special configuration, feel free to apply your custom nginx settings.

## Frontend Caching: Varnish

[Varnish](https://www.varnish-cache.org/) is an HTTP accelerator designed for content-heavy dynamic websites. Varnish is used by many high-profile, high-traffic websites including Wikipedia or The Guardian. We're using Varnish since a long time and he never let us down. As traffic spikes, he'll get you covered.

## FastCGI Process Manager: PHP-FPM

[PHP-FPM](http://php-fpm.org/) is a FastCGI Process manager for PHP and takes care of running the requests which are sent to the Webserver.

## Server-side Scripting Language: PHP

Every request is passed from PHP-FPM to PHP and is executed there. amazee.io supports PHP 5.6 and PHP 7.0.

## Database: MariaDB

[MariaDB](https://mariadb.org/) is a community-developed fork of the well-known MySQL database system. It's intended to be a drop-in replacement for MySQL. It comes with a couple of performance enhancements and new storage engines such as XtraDB.

## Search: Apache Solr

Solr is a search engine based on Apache Lucene™ which is used by Drupal modules such as [Search API Solr Search](https://www.drupal.org/project/search_api_solr).

## Tools

### Drush: Drupal Console

[Drush](http://www.drush.org/) is a command line shell interface for Drupal. At amazee.io Drush is used for connecting and synchronizing different sites within a sitegroup. Beside of that Drush is perfect for running your administrative tasks within a Drupal site, like downloading modules, installing modules, exporting configuration, etc.

### Dependency Manager for PHP: Composer

Web development would be much more complicated if there weren't any Dependency managers around. [Composer](https://getcomposer.org/) assists you keeping track of the dependencies used in your web application.

### NodeJS / NPM

[NodeJS](https://nodejs.org/en/) is a JavaScript runtime which supports you in simplifying your frontend workflow by enabling you to make use of the rich ecosystem which can be accessed by its package manager NPM.
