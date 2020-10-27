# rsync into container

This describes how sync files into a running container on OpenShift.

In order for this to work, you need `rsync` installed inside the container, adapt your Dockerfile accordingly.

If you don't have `oc` installed yet, please check the [installation](/openshift-beta.md) first.

1. select the right openshift project with showing first all projects:

         oc projects

2. select the correct project

         oc project <my-project-name>

3. run rsync command
{% raw %}
         oc rsync </source/directory> $(oc get pod -o go-template --template '{{(index .items 0).metadata.name}}' --show-all=false -l service=<servicename>):</destination/directory>
{% endraw %}
The rsync command needs to be adapted to your needs:

* `/source/directory>`  the directory on your computer you would like to rsync, needs to be a directory. If you omit a trailing slash, the given directory will be created within the destination directory
* `</destination/directory>` the directory inside the container were the source folder should be synced to. Important: This directory should be defined as a persistent storage directory in order for the files to exist between deployments
* `<servicename>` the name of the service (as defined in `.amazeeio.yml`) you would like to connect to, can be things like `node`, `nginx`, etc.
* If your service consists of multiple containers, you should also define the container via `--container=<containername>`



