# OS X - Cachalot Extended Usage
## Preferences
 Cachalot creates a preferences file under ```HOME/.amazeeio-cachalot/preferences.yml```, which can be used to override default options. This is an example of the default generated preferenes:

```
:preferences:
  :fsevents_disabled: false
  :create:
    provider: virtualbox
```
## Overwrite machine name
 Per default cachalot creates a docker-machine whit the name `amazeeio-cachalot`. If you want to override this machine name (e.g. to change it to 'default' so it can work with Kitematic), it can be changed here. First, destroy your current amazeeio-cachalot VM and then add the following to your `preferences.yml` file:

```
:preferences:
.
.
.
  :machine_name: default
```