# E-Mail Delivery

amazee.io enables you to send out emails from any environment. There is a local MTA in place which takes care of that. However if you need high reliability in sending emails out you should consider using a third party mail provider.

- [SendGrid](https://sendgrid.com/)
- [AmazonSES](https://aws.amazon.com/ses/?nc1=h_ls)
- [Mailgun](https://www.mailgun.com/)
- [Mailjet](https://www.mailjet.com/)

If you plan on using an external Mail Provider you can make use of the [Drupal SMTP Authentication Module](https://www.drupal.org/project/smtp).

## Mail Rerouting for environments
We support the possibility to reroute emails which are sent from Drupal. You can enable this setting for every site you host on amazee.io


## SPF Records
We list our outgoing mail servers in an SPF Entry. If you send emails via amazee.io we suggest adding this record to your DNS.

> example.com.  IN  TXT  "v=spf1 a mx include:spf.amazee.io ?all"
