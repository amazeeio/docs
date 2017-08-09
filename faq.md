# FAQ

## Stopping cachalot/pygmy, without losing data.
### cachalot
The command `cachalot stop` will shut down the Docker service running in your hypervisor, without destroying any of the running containers. You can bring it back up with `cachalot start`. Individual containers can be shut down using `docker-compose stop`, this will stop the container without destroying, `docker-compose down` stops the container and removes the volumes, destroying the data.
### pygmy
The command `pygmy stop` will only stop the pygmy services (haproxy, ssh-agent, etc). Individual containers can be shut down using `docker-compose stop`, this will stop the container without destroying, `docker-compose down` stops the container and removes the volumes, destroying the data.

## Disallow crawlers on my development environment.
No worries, that's already has been taken into consideration. All requests which are directed to a development environment have some additional headers which tell the crawlers to not index that particular website.

```
curl http://example.com.dev.dev1.compact.amazee.io/
HTTP/1.1 200 OK
Server: nginx
[...]
X-Robots-Tag: noindex, nofollow
```

## I need a special nginx.conf / solr core configuration
See our [page on custom configurations](customizations.md) to get your changes up and going in Docker. After that, reach out to us in Slack or via email ( [support@amazee.io](mailto:support@amazee.io) ) and we'll help you deploy those changes to our servers.
