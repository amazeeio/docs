# Varnish testing

We make use of Varnish to cache your website and deliver it as fast as possible.
Varnish is enabled on `production` sites by default. For `development` sites and on
your local docker environment Varnish is installed but not enabled for caching.

Sometimes you need to debug an issue on production without varnish being in your way.
Or you need to debug a development issue and you want to have varnish cache enabled to see if it works.

We got you covered in those edge cases and allow to defer the traffic with a cookie
to go to Varnish or to the backend nginx (bypassing varnish) for debugging reasons.

As creating cookies by hand is cumbersome there's a neat little helper which you
only need to visit an URL in order to get the cookie sent to your browser.

When you visit the URL you will be redirected back to the website. During the
redirect the cookie will be set on your browser.

The Cookie gets deleted when you close your browser window

| Backend  | Visit the URL in your Browser         |
|----------|---------------------------------------|
| Varnish  | example.com/amazeeio/upstream/varnish |
| Backend  | example.com/amazeeio/upstream/backend |
| Default* | example.com/amazeeio/upstream/default |


*Default : Varnish is enabled or disabled depending on the [Environment Type](environment_type.md)
