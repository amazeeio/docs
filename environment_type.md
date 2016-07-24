# Environments

Every site within amazee.io runs in a certain environment. Either this is **production** or it is **development**. Those environments have slight differences to each other:

## Production Environment

- Varnish enabled by default
- NewRelic is enabled
- PHP Errors are not displayed (`display_errors = off` and `display_startup_errors = off`)

## Development Environment

- Varnish bypassed by default
- NewRelic is disabled
- PHP Errors are displayed (`display_errors = on` and `display_startup_errors = on`)
- Every server response is tagged with a no-index header that tells search engines to not index the development site
