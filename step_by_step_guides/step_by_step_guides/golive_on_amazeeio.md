# Going Live with amazee.io


## DNS
To make it as easy as possible for you to get your site pointing to our servers we have dedicated loadbalancer records. Those technical DNS resource records are used just for that.

**Example:** `<loadbalancer-name>.hosted.on.amazee.io`

> Note: We strongly suggest not to configure any static IP address in your DNS Zones. As amazee.io is a cloud hosting and our loadbalancer infrastructure changes over time which can have impact on your site availability.

###Root Domains

Configuring the root domain (e.g. example.com) can be a bit tricky because the DNS specification does not allow to have the root domain pointed to a CNAME entry. Depending on your DNS Provider the record name is different:

- 
- ALIAS at DNSimple
- ANAME at DNS Made Easy
- ANAME at easyDNS
- ALIAS at PointDNS
- Alias record at Zerigo
- CNAME at CloudFlare.



## Domains
## SSL
