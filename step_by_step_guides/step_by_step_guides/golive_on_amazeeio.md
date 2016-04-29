# Going Live with amazee.io


## DNS
To make it as easy as possible for you to get your site pointing to our servers we have dedicated loadbalancer records. Those technical DNS resource records are used just for that.

**Example:** `<loadbalancer-name>.hosted.on.amazee.io`

> **Note:** We strongly suggest to not configure any static IP address in your DNS Zones. Our loadbalancer infrastructure may change over time which can have impact on your site availability if you configured a static IP address.

###Root Domains

Configuring the root domain (e.g. example.com) can be a bit tricky because the DNS specification does not allow to have the root domain pointed to a CNAME entry. Depending on your DNS Provider the record name is different:

- ALIAS at [DNSimple](https://dnsimple.com/)
- ANAME at [DNS Made Easy](http://www.dnsmadeeasy.com/)
- ANAME at [easyDNS](https://www.easydns.com/)
- ALIAS at [PointDNS](https://pointhq.com/)
- CNAME at [CloudFlare](https://www.cloudflare.com/).


## Domains
## SSL
