# Environments

## Production

- Varnish enabled by default
- NewRelic is enabled
- PHP Errors are not displayed

## Development

- Varnish disabled by default
- NewRelic is disabled
- PHP Errors are not displayed
- Every server response is being tagged with a no-index header that tells search engines to not index the development site
