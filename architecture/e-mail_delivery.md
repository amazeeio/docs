# E-Mail Delivery

amazee.io enables you to send out mails from any environment. There is a local MTA in place which takes care of that. However if you need high reliability in sending mails out you should consider using a third party mail provider.

- [SendGrid](https://sendgrid.com/)
- [AmazonSES](https://aws.amazon.com/ses/?nc1=h_ls)
- [Mailjet](https://www.mailjet.com/)

## Mail Rerouting for enviroments
We support the possibility to reroute mails sent from Drupal. You can enable this setting for every site you host on amazee.io


## SPF Records
We list our outgoing mailservers in a SPF Entry. If you send mails via amazee.io we suggest to add this record to your DNS.

> example.com.IN	TXT	"v=spf1 a mx include:spf.amazee.io ?all"