# FAQ

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
Send us a mail to `support@amazee.io` with the configuration and we'll help you to get this configuration deployed to our servers
