# System Components

Our stack is built was built from scratch with performance, security and reliability in mind. This page covers the main components of the amazee.io stack.

<!-- toc -->

## Operating System: Ubuntu

Our servers are set up using the latest [LTS (Long Term Support)](https://wiki.ubuntu.com/LTS) Version of [Ubuntu](http://www.ubuntu.com/server). This ensures stability and security as the LTS versions are supported for up to 5 years.

## Webserver: Nginx

Fully configured out of the box for Drupal 7 and Drupal 8. [Nginx](http://nginx.org/) is the Webserver component in our stack and pronounced "engine x". Nginx serves dynamic content using FastCGI handlers (see PHP-FPM below). Nginx is a

## Frontend Caching: Varnish

[Varnish](https://www.varnish-cache.org/) is an HTTP accelerator designed for content-heavy dynymic websites. Varnish is used by many high-profile, high-traffic websites including Wikipedia or The Guardian. We're using Varnish since a long time and he never let us down. As traffic spikes, he'll get you covered.

## FastCGI Process Manager: PHP-FPM

[PHP-FPM](http://php-fpm.org/) is a FastCGI Process manager for PHP and takes care of running the requests which are sent to the Webserver.

## Server-side Scripting Language: PHP

Every request is passed from PHP-FPM to PHP and is executed there. amazee.io supports PHP 5.6 and PHP 7.0.

## Database: MariaDB

[MariaDB](https://mariadb.org/) is a community developed fork of the well known MySQL database system. It's intended to be a drop-in replacement for MySQL. It comes with a couple of performance enhancements and new storage engines such as XtraDB.

## Search: Apache Solr

Solr is a search engine based on Apache Lucene™ which is used by Drupal modules such as [Search Api Solr Search](https://www.drupal.org/project/search_api_solr).

## Tools

### Composer

### NodeJS
