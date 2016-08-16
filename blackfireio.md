# Blackfire.io

Blackfire.io is the new way to profile your Drupal sites. Over are the times to handle clunky weird xhprof configurations and other things.

At amazee.io we ship Blackfire with every Local Drupal Development site and it is enabled on all development and production sites.

It is easily configured and setup.

## Initial Setup

1. In order to use Blackfire.io you need an Blackfire.io account, which is completely free! [Create one right now.](https://blackfire.io/signup)
2. Visit [your Blackfire.io account](https://blackfire.io/account) and copy the `Server ID` and `Server Token` from the _My Server Credentials_ section \(not the _My Client Credentials_ section!\)
3. Install the [Blackfire Chrome Companion](https://blackfire.io/docs/integrations/chrome)

![](/assets/Account_-_Blackfire.jpg)

## Local Docker Development with Blackfire Chrome Companion

1. Find the commented Blackfire section inside your `docker-compose.yml` file \(see an example [here](https://github.com/amazeeio/docker/blob/master/example-php70-basic.yml#L13)\)
2. Uncomment the lines `BLACKFIRE_SERVER_ID` and `BLACKFIRE_SERVER_TOKEN` and add the copied information from your Blackfire.io account. Here an example:

  ```
  environment:
  # If you would like to use blackfire.io, uncomment and add your server credentials:
  BLACKFIRE_SERVER_ID: bdda64f6-7c4f-4ec5-be32-f1a6f5680cb0
  BLACKFIRE_SERVER_TOKEN: fcc9ec9e54ffb4a35a5fcf7376f462eb85fe47e9fc978ed1df067c8b82afe500
  ```

3. restart your Docker container if it is running:

  ```
  docker-compose up -d --force-recreate
  ```

4. Visit your local Docker site

5. Click on the Blackfire Chrome Companion Icon, select "Profile" and after a couple of seconds you will have local site profiled.

6. Read more at [Analyzing Profiles](https://blackfire.io/docs/reference-guide/analyzing-profiles) about the Profiles that Blackfire generates.


## Local Docker Development with `blackfire` CLI tool

Every amazee.io Docker image has the `blackfire` CLI tool already installed, so you can use that instead of the Chrome Compagnion.

1. Follow Steps 1-3 from above.
2. Connect to the Docker Container
3. Run the `blackfire` command with defining the client-id and client-token from your [your Blackfire.io account](https://blackfire.io/account), example: 
        blackfire --client-id="5f12d5ef-5b63-4d16-9bd8-2c741fe6a3ed" --client-token="13210acce473f9d8f485f19088f8b0b83c03bc2938efface72b9de1506ed211d" curl http://mysite.docker.amazee.io/

