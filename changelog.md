# Changelog

Hi there! As we are improving amazee.io we started to release changelogs to highlight changes and new additions to the hosting stack.

<!-- toc -->

## 2016-09-14 - 🐳 Better support of Docker for Mac

Docker for Mac is out of Beta since a couple of weeks, but there are still big improvement in speed released. So the amazee.io team decided to wait a bit, before we will deprecated cachalot and fully focus on pygmy.

In any case, there are already developers using pygmy and Docker for Mac on their machines and we want to provide them the best experience possible.

So we fixed two problems that were bottering ourselves:

1. The git prompt is now around 20x faster while you are inside a docker container.
2. Xdebug Access is now as easy as with cachalot: Just start a debugging session and done. 

The second one was a bit a harder one. Unfortunately the networking with Docker for Mac is not perfect yet, and there is currently no way for a Docker container to know how to talk to the Docker Host itself. This is a (known issue)[]


## 2016-08-09 - 📬 Mail Logfile
Did you ever wonder how many mails are sent out via your website? We do too! We implemented some logging for your outgoing mails.
You'll find the `mail.log` in your homedirectory `logs/mail.log`

## 2016-08-09 - 🔐 HTTP Strict Transport Security Headers

[HTTP Strict Transport Security Headers](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security) short HSTS is a security policy mechanism which instructs your browser to talk only via HTTPS to a Site which sends out this header.

We follow best-practices and send out a HSTS max-age of one year. If you need a shorter HSTS max-age you can dial it in for every of your production sites individually.

## 2016-07-27 - Naming consistency for production sites

As all sites are available via `[sitename].[branchname].[server].[stack].amazee.io`. Sadly the production URL's were not sticking to that naming schema.
We rolled out a patch to include the branch name for production sites within the direct url.

Before: `example.com.zh1.compact.amazee.io`
New : `example.com.master.zh1.compact.amazee.io`


## 2016-07-27 - selectable Node.js Versions, because one Node.js is not enough

We just launched our newest addition: selectable Node.js versions.
You can now define exactly which Node.js version you would like to run your frontend build system with.
In order to do so, just add these two lines:

```
versions:
  node: 4
```

to your .amazeeio.yml file. This will let amazee.io know which Node.js version you would like. In this example the newest Node.js version 4. This version will be used whenever you run a command like npm or node.

If you need a specific minor or patch version (like 6.3.0), you can also define that.

You can choose from any of the available Node.js versions, but we strongly suggest to keep your code up to date with the newest one (currently 6.3.1).

This also applies to the Docker containers! Just make sure that you pull the newest containers, and whenever you connect to the container, your defined Node.js versions will be installed and used.

Happy Node.js-ing!

---
## 2016-07-27 - Updated Docker Images

With the launch of selectable Node.js versions, we finally updated our Docker Images as well, here some of the goodies:

- Updated to Varnish 4 from Varnish 3
- Updated nginx configurations
- Nginx and PHP Logs are now inside ~/logs
- Better TEMP environment variables
- On connecting to a container, you land directly where the webroot is
- Sqlite module for PHP added
- and a lot more

How to get the newest images? [Read here!](https://docs.amazee.io/local_docker_development/drupal_site_containers.html#update-images) And also specifically read the part about slow updates.

---
## 2016-07-13 - PHP and Nginx logs at your fingertips
Sometimes you just need to see the bare metal logs of what is happening on your Drupal site, and now you can!

Every site hosted on amazee.io has now a new folder called `~/logs/nginx` were we put all logs from the two nginx serving your site. So you know exactly what is going on on your site.

By default there are 4 files in there:

- **10fe-[sitename].access.log** - This is the access log from the frontend Nginx, which receives all requests to your site. Redirects are handled directly on this Nginx and not passed back, the same also for HTTP to HTTPS redirects. If this site is a production site it will pass the request to Varnish where the request might is cached. We actually use this file to generate the amount of hits per month.
- **10fe-[sitename].error.log** - If the frontend Nginx throws any errors or cannot handle a request, you will see them here. Usually this file stays empty.
- **20be-[sitename].access.log** - This is the access log from the backend Nginx, here you will see every request that has passed the frontend Nginx and Varnish. So these are requests that cannot be cached and will be handled by PHP.
- **20be-[sitename].error.log** - This is the error log from the backend Nginx, you will see here not only Nginx errors, but also any PHP and Drupal errors.

These files are logrotated, which means every week a new file is generated and the old file is renamed.

Btw if you would like to see real time logs, try:

`tail -f ~/logs/nginx/10fe-$AMAZEEIO_SITENAME.access.log`

and you will see the access logs of the frontend Nginx in real🕔, woohoo!

---
## 2016-07-13 - New environment variables which makes your Drupal Life easier
Environment variables are awesome✌️: They allow us to define some defaults for you, which you then just can use and don't need to worry about configuring our Drupal correctly or securely.

Since the last maintenance last night we welcome a few more environment variables to the 👨‍👩‍👧‍👦 👨‍👨‍👧‍👦:👩‍👩‍👧‍👦

- **AMAZEEIO_WEBROOT** - Some Drupal installations run inside a subfolder like 'web'. To make the handling of such sites easier there is this new environment variable which contains the absolute path to this subfolder like: '/var/www/drupal/public_html/web/'
- **AMAZEEIO_HASH_SALT** - Drupal needs a hash salt to generate secure cookies and one-time-login links. In Drupal 7 this hash salt was generated by the credentials of the Database, which is okay but not great. In Drupal 8 it is now required to define the hash salt in the settings.php, this is great but sometimes cumbersome. So we're providing you a hash salt as an environment variable, which is great and easy to use. We even make sure that this hash salt is the same across multiple sites inside a sitegroup, so that your dev, staging and production sites all have the same hash salt. (Now I'm hungry). See our [Drupal 8 example](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal8/sites/default/settings.php#L67).
- AMAZEEIO_TMP_PATH - Drupal needs a temporary directory which allows it to same files for a short time (like when you upload a file). This directory should not be accessible from the web and therefore not life inside the Drupal root. amazee.io generates such a directory inside the home directory at ~/tmp. To use that easily in side Drupal, there is this environment variable, which tells Drupal where to put it's files. And btw, we also tell PHP and it's modules to use the same folder, so all the temporary files have a common place to have a party 🎉  See the [Drupal 7 example](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal7/sites/default/settings.php#L74) and [Drupal 8 example](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal8/sites/default/settings.php#L62).
- **AMAZEEIO_PRODUCTION_URL** - Files are a vital part of any website, without 🖼  the world would just be half as pretty. But with many different development sites and even feature branch sites, these files can be a real pain. [Drupal Stage File Proxy](https://www.drupal.org/project/stage_file_proxy) to the rescue! This awesome module removes the need to synchronize the files from the production site to development and your local Docker base site, whenever Drupal needs a file and it cannot find it, it will just go to the production site and download it from there. Easy as 🍰 ! But of course you need to know the URL of the production site for that to work, and this is exactly what this environment variable does: Give you the URL of the production site. See the [Drupal 7 example](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal7/sites/default/development.settings.php#L30) and [Drupal 8 example](https://github.com/amazeeio/drupal-setting-files/blob/master/Drupal8/sites/default/development.settings.php#L28).
In case you wonder how to use these environment variables: You can use them in the settings.php files and with that make sure that you never have to worry about them.

Check out our [Drupal Settings Files](https://github.com/amazeeio/drupal-setting-files), which contains complete Drupal and Drush settings starter files, they are using all the available environment variables. You can just copy them inside your Drupal and with that be fully ready on amazee.io

Happy Drupaling!

---
## 2016-07-08 - Drupal in sub-📂? Now with SSH support 💪!
More and more of our clients are using Drupal inside a subfolder of a Git repository. The reasons for this are multiple: Coming from other Drupal Hosters where this is required, using the Drupal Composer Project or just preference.

Since the beginning amazee.io supported all ways of building your folder structure: Having Drupal directly in the root folder of Git, having it inside a subfolder or even in a deeper folder structure, full freedom 🆓!

Today we rolled out two small fixes to all sites:

1. There is now a new environment variable called `AMAZEEIO_WEBROOT` which tells you the full path to where the Drupal lives, in case you need it anywhere

2. When you ssh into any site, you land directly in the correct folder to run stuff like drush or other commands that expect you to be in the Drupal folder.

Improvements every week! - amazee.io

---
## 2016-07-05 - New image processing and git improvements on backends

As part of this week's maintenance, we have installed [GraphicsMagick](http://www.graphicsmagick.org/) on all our backend servers. If you would like to use this alternative to GD and ImageMagick, you will need the [ImageMagick Drupal module](http://dgo.to/imagemagick), and to tell it the executable path for GraphicsMagick is at /usr/bin/gm.

Also updated today, the git command line tool on our backend servers now knows who it is! We are publishing a .gitconfig file to the home directory of your site, so that when git runs it can know what user it belongs to.

---
## 2016-06-28 - Higher Security by default 🔐
Our whole stack has a strong focus on security, from the beginning we implemented a highly restrictive Linux User permissions system, which prevented a site to have access to any other site, not to code, not the database, not the files or anything else.

Today we go a step further: We have now AppArmor profiles running, which lock sites down even more.

Wanna try it out? Start trying out with a "ps aux".

Got any questions about AppArmor or problems with it? Shoot us a 📧 to support@amazee.io or in Slack, we're happy to help.

---
## 2016-05-10 Varnish Configuration Improvements
Last week we upgraded to Varnish 4.0🌪 to make your site blazing fast . We optimized some portions of the configuration to make error handling more robust and also implemented some security measures. Go Varnish Go👌🏼

---
## 2016-05-10 Fancy a, TMP Directory 📂

Drupal needs a directory to handle uploads or save data temporarily - the so-called tmp or temp directory. Our servers come with that pre-equipped now. You can now rely on using the Environment Variable AMAZEEIO_TMP_PATH for temporary files.

For more information about Environment Variables head over to the Documentation: https://docs.amazee.io/drupal/environment_variables.html

But how is that working for the cluster hosted sites you might ask? No worries we got you covered there too. The path is just slightly different for cluster sites but synchronized 🔃 across the backend web servers. It's easy as that!

---
## 2016-05-04 Security: ImageTragick / OpenSSL
Yesterday was quite intense regarding security updates:

First there was a OpenSSL Patch🔒  released and applied to all our systems.

Later we saw that the [ImageTragick🖼](https://imagetragick.com/) remote code execution vulnerability was made public. Our engineers acted fast and came up with a patch to mitigate this threat to all amazee.io servers.

---
## 2016-05-04 Varnish 4.0

Varnish 3 was the workhorse on our frontend servers and saved us many times from having to add more servers on the backend. Why? Because he does his job so very well! He withstands the biggest traffic spikes but now it's time to retire and make space for Varnish 4.0☄️.

We rewrote the frontend caching configuration and polished everything to get the most OOMPH🌪 out of Varnish 4.0.

---
## 2016-04-26 PHP 5.6 and PHP 7.0 <3
Two PHP Versions on the same server? When we had this idea people said "This is not possible. Or at least it's crazy!" Then our engineers went to work. And we're happy to announce that we are able to support PHP 7.0 on all systems. Switching is done faster than you can say "I can compile php 7 from scratch". Send us a mail to support@amazee.io and we switch your sites over to PHP 7.0.👌

PHP 7.0 comes with a huge performance boost and makes your Drupal Site faster than ever. And we all love fast websites.

🏼🏁 The future is here!

---
## 2016-04-12 Redirects : www and non-www

You might want to have your site prefixed with www. Or maybe you fancy not having it.

From the beginning we supported having a redirect from non-www to www (example.com → www.example.com) but sadly not the other way around. There was a workaround tough. Workarounds should be temporary. On top of this we listened to our customers who demanded this feature.👂🏽

We're proud to announce that this feature has now rolled out to all AmazeeIO Infrastructure!🙌

If you want to have the redirects put in place, talk to our engineers they’ll be happy to get you set up.👷🏻

---
## 2016-04-12 New Deployment Infrastructure
Our deployment was great already. We set out to improve the rough edges and rewrote it from scratch based on the learnings of the previous version.

**Features include:**

- User friendly Slack status messages, so you can see when something is on 🔥 and why.
- A nice deployment log which shows every single step that happens during a deployment, [here an example](https://deploylogs.amazeeio.cloud/amazeelabs-amazeelabs_com-deploy/4/NTBjNGQwZDdkODY3Yzc5OWUxODYxOTY2.txt) 😎
- A new structure in our yml files which allows the deployment scripts to run each deploy task by itself, because we like structure 🤓
Happy Deployments!

---
## 2016-04-12 IPv6 - Redirects and Resolver

IPv6 is gaining momentum but it looked like our server level redirect didn't support it right from the beginning ☔️. And visitors ended up seeing our splash-page 😾.  

We fixed that by now and all domain redirects work now out of the box with IPv6 👌🏼

Another issue lived within nginx and DNS resolving. Nginx had issues with the notation of the addresses we provided. Glad we fixed that! 😺

---
## 2016-04-05 Say 'Adios' to Database usernames and passwords

We went great lengths with making setting up a Drupal site as easy as possible by having everything configured with environment variables 🎯.

Still usernames and passwords for the database were generated when we created the vhost for the first time on the server. The best password is one you don't even need to think about, because it is generated in background and put in place automatically (and ideally it's long, cryptic and involves letters and numbers). By  now all usernames and passwords for databases are automatically generated and can be rolled over across all servers if need would be 💪.

Enjoy!

The AmazeeIO DevOps Team

---
## 2016-03-30 zh1.cluster: Good things like PHP 5.6 will take a while
Remember that we said three weeks ago, that we will wait with the PHP 5.6 rollout for the zh1.cluster another week? Well we lied 😅, just a bit 😇

It took us a bit longer. Reasons are many, and one of them includes a 🦄

We are very happy to announce that all servers have successfully been upgraded to PHP 5.6 💪

Happy coding!

---
## 2016-03-24 No Access for You
Since the beginning, AmazeeIO kept non-productive sites hidden from search engines and crawlers 💪

It did that with sending the "X-Robots-Tag: noindex, nofollow" Headers, which keeps the search engines from indexing the sites.

Unfortunately that is not enough in some cases, the data that the development sites contain are just too important 🙈

Starting from today, it is now possible to set a Basic Auth for all sites (a simple username and password prompt, sometimes wrongly 🤓 refereed as "htaccess"), to keep the bad guys 🕵 from spying  👀 👻

---
## 2016-03-15 bye bye OCFS & CEPH, welcome NFS

Dear OCFS & CEPH

You did a good job as a distributed and clustered file system on zh1.cluster.

Unfortunately it is time to say goodbye. You tried hard during big load and failovers, but we would have expected a better reliability. Maybe you where the wrong choice from the beginning.

We decided to move forward with NFS, which is much more experienced in handling big loads and a lot of files.

Bye Bye 👋👋

All the best

The AmazeeIO DevOps Team

---
## 2016-03-08 Welcome blackfire.io

As promised last week, we're very pleased to have blackfire.io as a tool ready to be used within AmazeeIO ◾️🔥

There is not much to say about, just that it is the best profiling tool we've ever seen 😍

Not convinced? Check out a [demo profiling](https://blackfire.io/profiles/f89f1446-f1ce-43c5-9f6f-e7741ccfd7c5/graph) of amazee.io

**Setup is easy:**
- Create a [blackfire.io](https://blackfire.io/) account (the free account is plenty for a start)
- Visit https://blackfire.io/account/credentials
- Send **Server ID** and **Server Token** over to the @devops team
- Install the [Google Chrome extension](https://blackfire.io/docs/integrations/chrome) or the [CLI tool](https://blackfire.io/docs/up-and-running/installation#install-cli-debian), point them to a site hosted on AmazeeIO and 💥: start profiling

---
## 2016-03-08 PHP 5.6 Rollout compact and single
Remember how we tested PHP 5.6 last week on dev1.compact? Looks like there where no issues and so we decided to roll it out to more Servers 😎

These servers are now running with a 🏃🆙💪 PHP 5.6:

- dev1.compact
- zh1.single
- attribute1.compact
- swisscom1.compact
- sa1.compact
- us1.compact
-
For zh1.cluster we decided that we gonna wait another week

---
## 2016-03-02 Improvement day!

- MariaDB only allowed 200 connections at the same time, which with all the success of AmazeeIO was not enough anymore, MariaDB accepts now 400 connections 💪
- Solr logged per default every single request to it's log file. Believe us, that was a lot of logs. Solr is now only logging what is really necessary 📝
- We forgot that some sites just don't need a cron 🙈, we implemented that non-possibility now 🐵

---
## 2016-03-02 Xhprof removed

Xhprof reached it's end of life and is not compatible to php 5.6 and php 7, fare well xhprof 😚👋

But we're already working on adding Blackfire.io support! Stay tuned. 😎

---
## 2016-03-02 Solr Environment Variables

Solr environment variables where exposed to PHP even though Solr was maybe not enabled for this site. We know that we all like Solr, but this was too much. Solr Environment Variables behave now correctly and are only exposed if Solr is enabled.

---
## 2016-03-02 PHP 5.6 for dev1.compact
With the soon (July 2016) end of life of PHP 5.5, we thought it's a good idea to upgrade our PHP 5.5 to 5.6! 🚀

In case some things break, we only rolled it out to dev1.compact.amazee.io so we all can test before it's rolled out to the production servers next week.

Please report any issues to @devops.

---
##  2016-02-24 Welcome :)

Welcome to our AmazeeIO changelog, where you will find the latest changes of AmazeeIO and all it's services.

Stay tuned!
