# Environments

Every site within amazee.io runs in a certain environment. Either this is **production** or it is **development**. Those environments have slight differnces to each other, you can read about those differences below:

## Production Environment

- Varnish enabled by default
- NewRelic is enabled
- PHP Errors are not displayed

## Development Environment

- Varnish disabled by default
- NewRelic is disabled
- PHP Errors are displayed
- Every server response is tagged with a no-index header that tells search engines to not index the development site
