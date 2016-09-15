# Xdebug

## Xdebug inside Local Docker Development

The local Docker development environment supports Xdebug out of the box. 

As running the PHP Xdebug module makes PHP around 25% slower, we implemented a clever way to have the speed and convenience of Xdebug: The nginx analyses your request and if it sees `xdebug` inside a cookie or an GET parameter it will automatically use a PHP process with Xdebug enabled. With that you don't have to worry about starting or stopping Xdebug at all.

In order to start an Xdebug debugging session from your IDE, we need to tell PHP which Xdebug IDE key to use. In our example we are using PhpStorm, but in any other IDE it is gonna be very similar:

Just follow steps 2-8 from the [PhpStorm documentation](https://confluence.jetbrains.com/display/PhpStorm/Zero-configuration+Web+Application+Debugging+with+Xdebug+and+PhpStorm), and start debugging!

If you have problems, ensure that Xdebug is properly loaded inside the container:

1. Login as Administrator on your Drupal site
2. Enable the Debugging Cookie (Step 4 from the [PhpStorm documentation](https://confluence.jetbrains.com/display/PhpStorm/Zero-configuration+Web+Application+Debugging+with+Xdebug+and+PhpStorm))
3. Visit http://mysitename.com.docker.amazee.io/admin/reports/status/php (replace mysitename.com with your site name)
4. On this page you should see in the second box something like that:

```
This program makes use of the Zend Scripting Language Engine:
Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies
   with Zend OPcache v7.0.10-2+deb.sury.org~trusty+1, Copyright (c) 1999-2016, by Zend Technologies 
   with Xdebug v2.4.1, Copyright (c) 2002-2016, by Derick Rethans
   with blackfire v1.12.0, https://blackfire.io, by Blackfireio Inc.
```

Important is **`with Xdebug`**, which tells you that the Xdebug module is properly loaded.

If you don't see `with Xdebug` in this block, make sure that your browser sends a debugging Cookie (search on the phpinfo page for `$_COOKIE['XDEBUG_SESSION']`)

Still problems? [We're happy to support you](https://docs.amazee.io/support.html).