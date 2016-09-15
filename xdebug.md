# Xdebug

## Xdebug inside Local Docker Development

The local Docker development environment supports Xdebug out of the box. 

As running the PHP Xdebug module makes PHP around 25% slower, implemented a clever way to have the speed and convenience of Xdebug: The nginx analyses your request and if it sees `xdebug` inside a cookie or an GET parameter, will automatically use a PHP process with Xdebug enabled. With that you don't have to worry about starting or stopping Xdebug.

