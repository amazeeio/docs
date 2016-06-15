# Linux `pygmy` Help
Most issues with `pygmy` can be resolved with:

![Have you tried turning it off and on again?](itsupport.gif)


    pygmy restart -d

If that does not help, try restart other services, in this order:

1. Docker
2. Whole system

## I get an error like `port is already allocated.` during start

If during the start of Docker containers you see an error like that:

    docker: Error response from daemon: driver failed programming external connectivity on endpoint
    amazeeio-haproxy (654d1f1c17b0f7304570a763e1017808b214b81648045a5c64ed6a395daeec92):
    Bind for 0.0.0.0:443 failed: port is already allocated.

This means that another service (can be another Docker container, or in case of Linux based systems another service like an installed nginx) is already using this Port.

You should stop this service or Docker container first.
