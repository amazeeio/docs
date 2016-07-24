# URL Structure

## Development sites

Development sites follow a special URL structure which allows you to easily find and understand on which server you are hosting. This structure is as follows:

    http://[domain].[branchname].[servername].amazee.io

An example:

http://yoursite.com.dev.zh1.compact.amazee.io/

* `yoursite.com` is the defined domain for this site
* `dev` is the branch this site is deploying
* `zh1.compact` is the server this site is running on
* `amazee.io` tells you that you are hosted with us! ❤️

## Production sites

Production sites are usually called via their defined domain like:

    http://www.yoursite.com

For testing purposes, production sites can also be reached via the same URL structure like development sites:

    http://[domain].[branchname].[servername].amazee.io

In the example where the domain of the production site is `www.yoursite.com`, the site is also reachable under:

