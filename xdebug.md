# Xdebug

## Xdebug inside Local Docker Development

The local Docker development environment supports Xdebug out of the box. 

As running the PHP Xdebug module makes PHP around 25% slower, implemented a clever way to have the speed and convenience of Xdebug: The nginx analyses your request and if it sees `xdebug` inside a cookie or an GET parameter, will automatically use a PHP process with Xdebug enabled. With that you don't have to worry about starting or stopping Xdebug.

In order to start an Xdebug debugging session from your IDE, we need to tell PHP which Xdebug IDE key to use. In our example we are using PhpStorm, but in any other IDE it is gonna be very similar:

1. Create Bookmarklets: 