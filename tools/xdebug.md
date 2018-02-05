# Xdebug

## Xdebug inside Local Docker Development

The local Docker development environment supports Xdebug out of the box.

Important: Xdebug does not work when Varnish is enabled. Varnish is by default not enabled locally, so this is usally not a problem.

As running the PHP Xdebug module makes PHP around 25% slower, we implemented a clever way to have the speed and convenience of Xdebug: The nginx analyses your request and if it sees `xdebug` inside a cookie or an GET parameter it will automatically use a PHP process with Xdebug enabled. With that you don't have to worry about starting or stopping Xdebug at all.

In order to start an Xdebug debugging session from your IDE, we need to tell PHP which Xdebug IDE key to use. In our example we are using PhpStorm, but in any other IDE it is gonna be very similar:

Just follow steps 2-8 from the [PhpStorm documentation](https://confluence.jetbrains.com/display/PhpStorm/Zero-configuration+Web+Application+Debugging+with+Xdebug+and+PhpStorm), and start debugging!

If you have problems, ensure that Xdebug is properly loaded inside the container:

1. Login as Administrator on your Drupal site
2. Enable the Debugging Cookie \(Step 4 from the [PhpStorm documentation](https://confluence.jetbrains.com/display/PhpStorm/Zero-configuration+Web+Application+Debugging+with+Xdebug+and+PhpStorm)\)
3. Visit [http://mysitename.com.docker.amazee.io/admin/reports/status/php](http://mysitename.com.docker.amazee.io/admin/reports/status/php) \(replace mysitename.com with your site name\)
4. On this page you should see in the second box something like that:

```
This program makes use of the Zend Scripting Language Engine:
Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies
   with Zend OPcache v7.0.10-2+deb.sury.org~trusty+1, Copyright (c) 1999-2016, by Zend Technologies
   with Xdebug v2.4.1, Copyright (c) 2002-2016, by Derick Rethans
   with blackfire v1.12.0, https://blackfire.io, by Blackfireio Inc.
```

Important is `with Xdebug`, which tells you that the Xdebug module is properly loaded.

If you don't see `with Xdebug` in this block, make sure that your browser sends a debugging Cookie \(search on the phpinfo page for `$_COOKIE['XDEBUG_SESSION']`\)

### xdebug in Windows
To support using xdebug in Windows, use [this guide](https://www.petri.com/loopback-adapter-installation-windows-server-2012) to add a loopback interface with the IP `172.16.172.16`. After the interface is created, restart your containers and check that the `xdebug.remote_host` is not `localhost`.

Still problems? [We're happy to support you](https://docs.amazee.io/support.html)

## Xdebug Remote Drupal

It is also possible to xdebug a Drupal that is running on amazee.io servers. In order for that to work, Xdebug needs to be enabled on the server. Please [check with us](/support.md) so we can enable that for you.

Xdebug needs to be able to create a TCP connection to your IDE, as we are on a remote server, we can create an SSL Tunnel for that:

```
ssh -R 9000:localhost:9000 mysitename@server1.compact.amazee.io
```

**Important:** The SSH Tunnel needs to be created from your computer's terminal directly, not inside the Local Docker Container!

Replace `mysitename` with the name of the site, and `server1.compact.amazee.io` with the server were your site is running. If you are unsure what these are, connect inside the Docker Container via Drush to the site you need to debug and you will see the sitename and server in the prompt.

Now you can follow steps 2-8 from the [PhpStorm documentation](https://confluence.jetbrains.com/display/PhpStorm/Zero-configuration+Web+Application+Debugging+with+Xdebug+and+PhpStorm), and start debugging!

Still problems? [We're happy to support you](https://docs.amazee.io/support.html)
