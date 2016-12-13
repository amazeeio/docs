# Linux `pygmy` Help

<!-- toc -->

Most issues with `pygmy` can be resolved with:

![Have you tried turning it off and on again?](itsupport.gif)


    pygmy restart -d

If that does not help, try restart other services, in this order:

1. Docker
2. Reboot your computer

## I get an error like `port is already allocated.` during start

If during the start of Docker containers you see an error like that:

    docker: Error response from daemon: driver failed programming external connectivity on endpoint
    amazeeio-haproxy (654d1f1c17b0f7304570a763e1017808b214b81648045a5c64ed6a395daeec92):
    Bind for 0.0.0.0:443 failed: port is already allocated.

This means that another service (can be another Docker container, or in case of Linux based systems another service like an installed nginx) is already using this Port.

You should stop this service or Docker container first.

## I get an error like `listen tcp 0.0.0.0:53: bind: address already in use` during `pygmy up`

If during starting of `pygmy` you see an error like that:

        Error response from daemon: driver failed programming external connectivity on endpoint amazeeio-dnsmasq:
        Error starting userland proxy: listen tcp 0.0.0.0:53: bind: address already in use
        Error: failed to start containers: amazeeio-dnsmasq

You are probably on Ubuntu and the by default started DNS server by Ubuntu conflicts with the one we provide with `pygmy`. You should disable it, see here: http://askubuntu.com/a/233223 (no worries, the default started DNS server is actually not used, so it's safe to disable it).

If you still run into the error run following command `sudo netstat -tulpn` to see the processlist look for the service running on port 53 (you should find that process in the `Local Address` column). Look for the Process ID (PID)

With the Process ID you can now run following command:

> sudo kill [Process ID]
