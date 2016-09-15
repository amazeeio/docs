# Xdebug

## Xdebug inside Local Docker Development

The local Docker development environment supports Xdebug out of the box. 

As running the PHP Xdebug module makes PHP around 25% slower, implemented a clever way to have the speed and convenience of Xdebug: The nginx analyses your request and if it sees `xdebug` inside a cookie or an GET parameter, will automatically use a PHP process with Xdebug enabled. With that you don't have to worry about starting or stopping Xdebug.

In order to start an Xdebug debugging session from your IDE, we need to tell PHP which Xdebug IDE key to use. In our example we are using PhpStorm, but in any other IDE it is gonna be very similar:

Just follow steps 2-8 from the [PhpStorm documentation](https://confluence.jetbrains.com/display/PhpStorm/Zero-configuration+Web+Application+Debugging+with+Xdebug+and+PhpStorm). 

If you have problems, ensure that Xdebug is properly loaded inside the container:

1. Login as Administrator on your Drupal site
2. Enable the Debugging Cookie (Step 4 from https://confluence.jetbrains.com/display/PhpStorm/Zero-configuration+Web+Application+Debugging+with+Xdebug+and+PhpStorm#Zero-configurationWebApplicationDebuggingwithXdebugandPhpStorm-4.Activatedebuggeronserver)
3. Visit http://mysitename.com.docker.amazee.io/admin/reports/status/php (replace mysitename.com with your site name)
4. Enable 