# Going Live with amazee.io

<!-- toc -->

## DNS
To make it as easy as possible for you to get your site pointing to our servers we have dedicated loadbalancer DNS records. Those technical DNS resource records are used just for getting your site linked to amazee.io infrastructure and serve no other purpose.

**Example:** `<loadbalancer-name>.hosted.on.amazee.io`

{% hint style='info' %}
We strongly suggest to not configure any static IP address in your DNS Zones. Our loadbalancer infrastructure may change over time which can have impact on your site availability if you configured a static IP address.
{% endhint %}

###Root Domains
Configuring the root domain (e.g. example.com) can be a bit tricky because the DNS specification does not allow to have the root domain pointed to a CNAME entry. Depending on your DNS Provider the record name is different:

- ALIAS at [DNSimple](https://dnsimple.com/)
- ANAME at [DNS Made Easy](http://www.dnsmadeeasy.com/)
- ANAME at [easyDNS](https://www.easydns.com/)
- ALIAS at [PointDNS](https://pointhq.com/)
- CNAME at [CloudFlare](https://www.cloudflare.com/).


## Domains
amazee.io allows you to point several domains to a single site. We recommend to use just one main domain and redirect the other domains to the main domain. This is better for SEO and easier for you to manage the sites.

## SSL/HTTPS
You can enable SSL on your sites. Feel free to get in touch with us to enable this feature on your site support@amazeelabs.com
