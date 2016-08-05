# Comparison of amazee.io, Pantheon, Acquia Cloud, Platform.sh

This comparison is provided by amazee.io itself and does not take guarantee that it is completely correct. We love our competitors and know that they provide an outstanding service. This comparison shows how amazee.io is different than our loved competitors.



<table>
<tbody>
	<tr>
		<td colspan="5"><h3>Hosting Stack</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Drupal optimized hosting Stack</strong></td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
		<td>⚠️ some DevOps knowledge and configuratin necessary, examples existing</td>
	</tr>
	<tr>
		<td><strong>Custom webserver configurations</strong></td>
		<td>✅ custom configurations possible. Easy testing inside Local Docker Development</td>
		<td>❌️ no custom configurations</td>
		<td>❌️ no custom configurations</td>
		<td>⚠️ some customizability via ‘.platform.app.yaml’ file</td>
	</tr>
	<tr>
		<td><strong>On-demand server elasticity</strong></td>
		<td>✅</td>
		<td>✅</td>
		<td>⚠️ only on Enterprise plan</td>
		<td>⚠️ only on Enterprise plan</td>
	</tr>
	<tr>
		<td><strong>Automated security updates of OS and Services</strong></td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td><strong>24x7 infrastructure and application monitoring</strong></td>
		<td>✅</td>
		<td>⚠️ only on Elite plan</td>
		<td>⚠️ only on Enterprise plan</td>
		<td>⚠️ only on Enterprise plan</td>
	</tr>
	<tr>
		<td><strong>Locations</strong></td>
		<td>anywhere in the word possible, currently: Switzerland, USA, South Africa, UK</td>
		<td>US only</td>
		<td>Bound to Amazon AWS: US, Ireland, Japan, Singapore, Australia</td>
		<td>no information</td>
	</tr>
	<tr>
		<td><strong>On-premises Hosting possible</strong></td>
		<td>✅</td>
		<td>❌️</td>
		<td>❌️</td>
		<td>❌️</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Local Development</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Local development provided</strong></td>
		<td>✅ Local Docker Based Development - Windows, Linux, Mac</td>
		<td>✅ via kalabox, external tool with support for Pantheon - Windows, Linux, Mac</td>
		<td>✅ Acquia Dev Desktop - Windows, Mac - no Linux</td>
		<td>❌️</td>
	</tr>
	<tr>
		<td><strong>Local development congruent to development and production sites</strong></td>
		<td>✅ exactly the same services and configurations like development and production sites</td>
		<td>❌️ different services and configurations, no Varnish locally</td>
		<td>❌️ different services and configurations, no Varnish or Apache Solr locally</td>
		<td>❌️ no local development</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Drupal, PHP, Composer, Node.js</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>PHP Versions</strong></td>
		<td>5.6, 7.0</td>
		<td>5.3, 5.4, 5.5, 5.6, 7.0</td>
		<td>5.6, 7.0</td>
		<td>5.6, 7.0, HHVM</td>
	</tr>
	<tr>
		<td><strong>Drupal core &amp; contrib security updates</strong></td>
		<td>✅ via Drop Guard (price reduction for <a href="http://amazee.io">amazee.io</a> clients)</td>
		<td>✅ when using Pantheon Drupal Version Drops</td>
		<td>⚠️ only enterprise or external service</td>
		<td>⚠️ only via external service</td>
	</tr>
	<tr>
		<td><strong>Support for Composer</strong></td>
		<td>✅ full support for composer, run composer install with deploy_tasks, no need to commit vendor folder</td>
		<td>❌️ no execution of composer install possible, need to commit vendor folder</td>
		<td>❌️ no execution of composer install possible, need to commit vendor folder</td>
		<td>✅ full support for composer, no need to commit vendor folder</td>
	</tr>
	<tr>
		<td><strong>Support for Node.js</strong></td>
		<td>✅ full support for Node.js tasks like gulp during deployment tasks</td>
		<td>❌️ no execution of Node.js possible</td>
		<td>❌️ no execution of Node.js possible</td>
		<td>✅ full support for Node.js tasks like gulp during deployment tasks</td>
	</tr>
	<tr>
		<td colspan="5"><h3>SSL Certificates &amp; HTTPs</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Free SSL/HTTPs</strong></td>
		<td>✅</td>
		<td>❌️ extra costs</td>
		<td>❌️ extra costs</td>
		<td>✅</td>
	</tr>
	<tr>
		<td><strong>Free SSL Certificate provided</strong></td>
		<td>✅ free and fully automated Let’s Encrypt certificate. Or bring your own certificate</td>
		<td>❌️ need to self organize, additional costs</td>
		<td>❌️ need to self organize, additional costs</td>
		<td>❌️ need to self organize, additional costs</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Caching</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Caching</strong></td>
		<td>✅ Varnish 4, definable max-caching time, purging via varnish, expire or purge module</td>
		<td>✅ Varnish, maximum caching of 24h</td>
		<td>✅ Varnish 3</td>
		<td>✅ no Varnish but HTTP Caching on nginx level, maximum caching of 15min</td>
	</tr>
	<tr>
		<td><strong>Cache purging from Drupal</strong></td>
		<td>✅ via varnish, expire or purge module</td>
		<td>❌️ no purging from Drupal</td>
		<td>via Acquia Purge Module</td>
		<td>❌️ no purging from Drupal</td>
	</tr>
	<tr>
		<td><strong>External Caching Systems (CDNs, Fastly)</strong></td>
		<td>✅ Varnish automatically detects external Caching system and disables caching</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td colspan="5"><h3>SSH &amp; Remote Access</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Shell access via SSH</strong></td>
		<td>✅ authentication via ssh public key</td>
		<td>❌️ no shell access, only remote Drush commands</td>
		<td>✅ authentication via ssh public key</td>
		<td>✅ authentication via ssh public key</td>
	</tr>
	<tr>
		<td><strong>File transfers</strong></td>
		<td>✅ scp, sftp, rsync</td>
		<td>✅ sftp (easy), rsync (complicated)</td>
		<td>✅ scp, sftp, rsync</td>
		<td>✅ rsync</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Git</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Git support</strong></td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td><strong>External hosted Git Repositories</strong></td>
		<td>✅, by default</td>
		<td>❌️ only with custom built synchronisation server or pushing into two git remotes</td>
		<td>❌️ only with custom built synchronisation server or pushing into two git remotes</td>
		<td>⚠️ integration into GitHub and Bitbucket, other repositories only with custom built synchronisation server or pushing into two git remotes</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Development sites/environments &amp; Workflows</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Separate development, staging, and production sites/environments</strong></td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td><strong>Custom naming of development sites/environments</strong></td>
		<td>✅ fully custom, based on git branch names</td>
		<td>⚠️ only multidev environments, default ones are called dev, test, live</td>
		<td>⚠️ only additional environments, default ones are called dev, staging, prod</td>
		<td>✅ fully custom, based on git branch names</td>
	</tr>
	<tr>
		<td><strong>Custom development, branching and merging workflows</strong></td>
		<td>✅ fully custom, no forced workflows, deployment of branches</td>
		<td>⚠️ code can be committed via git to dev and multidev enviornments, deployments to test and live environments only via UI or CLI.</td>
		<td>✅ fully custom, no forced workflows, deployment either via branches or tags selected in UI</td>
		<td>✅ fully custom, no forced workflows, deployment of branches</td>
	</tr>
	<tr>
		<td><strong>Synchronisation of files and database between sites/environments</strong></td>
		<td>✅ based on drush sql-sync and drush rsync commands</td>
		<td>✅ via UI or via CLI tool</td>
		<td>✅ via UI only</td>
		<td>✅ via UI or via CLI tool</td>
	</tr>
	<tr>
		<td><strong>Custom deployment tasks</strong></td>
		<td>✅ any command possible</td>
		<td>❌️ no custom deployment tasks, only update.php and drush cr</td>
		<td>✅ any command possible</td>
		<td>✅ any command possible</td>
	</tr>
	<tr>
		<td><strong>Cloud hooks / web hooks</strong></td>
		<td>✅ possibility for webhooks inside of .amazeeio.yml file</td>
		<td>✅ via pantheon.yml file</td>
		<td>✅ via Acquia Cloud Hooks</td>
		<td>✅</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Drush</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Drush support</strong></td>
		<td>✅ full support of all commands</td>
		<td>⚠️ some commands not supported (like sql-sqlc, php-eval)</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td><strong>Automated Drush Site-Aliases</strong></td>
		<td>✅ no need for downloading new alias files by hand or run a CLI command</td>
		<td>⚠️ need to download new Drush Site-Aliases via UI or CLI</td>
		<td>⚠️ need to download new Drush Site-Aliases via UI or CLI</td>
		<td>⚠️ need to download new Drush Site-Aliases via UI or CLI</td>
	</tr>
	<tr>
		<td colspan="5"><h3>xDebug, Blackfire, New Relic</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>xDebug on development or production sites/environments</strong></td>
		<td>✅ remote xDebug via ssh tunnel</td>
		<td>❌️ no xDebug</td>
		<td>⚠️ needs to be enabled first</td>
		<td>✅ remote xDebug via ssh tunnel</td>
	</tr>
	<tr>
		<td><strong>Blackfire on development or production sites/environments</strong></td>
		<td>✅ blackfire available</td>
		<td>❌️ no blackfire</td>
		<td>❌️ no blackfire</td>
		<td>✅ blackfire available</td>
	</tr>
	<tr>
		<td><strong>New Relic</strong></td>
		<td>✅ free New Relic Pro</td>
		<td>✅ free New Relic Pro</td>
		<td>⚠️ only NewRelic Lite</td>
		<td>❌️ no New Relic</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Support &amp; SLAs</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>SLA</strong></td>
		<td>✅</td>
		<td>⚠️ only on Elite plan</td>
		<td>⚠️ only on Enterprise plan</td>
		<td>⚠️ only on Enterprise plan</td>
	</tr>
	<tr>
		<td><strong>Support</strong></td>
		<td>Slack, E-Mail, Website, Phone</td>
		<td>E-Mail, Website; Elite only: Phone</td>
		<td>E-Mail, Website; Enterprise only: Phone</td>
		<td>Slack, E-Mail, Website, Phone</td>
	</tr>
	<tr>
		<td><strong>24x7 emergency phone support</strong></td>
		<td>✅</td>
		<td>⚠️ only on Elite plan</td>
		<td>⚠️ only on Enterprise plan</td>
		<td>⚠️ only on Enterprise plan</td>
	</tr>
	<tr>
		<td><strong>Drupal support</strong></td>
		<td>✅</td>
		<td>⚠️ only on Elite plan</td>
		<td>⚠️ only on Enterprise plan</td>
		<td>⚠️ only on Enterprise plan</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Backups</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Automated Backups</strong></td>
		<td>✅ automated complete (files, code, db) backups. Daily backups kept for 1 week, weekly backups for 1 month</td>
		<td>✅ automated complete (files, code, db) backups. Daily backups kept for 1 week, weekly backups for 1 month</td>
		<td>⚠️ only automated database backups. Daily backups kept for 3 days. (longer internal backups but no access for clients)</td>
		<td>❌️ no automated backups, needs to be executed manually, backups kept for 14 days max</td>
	</tr>
	<tr>
		<td><strong>Support for “backup and migrate” module</strong></td>
		<td>✅ full support to save backups externally. Custom Crons provide even more flexibility.</td>
		<td>❌️ no support of “backup and migrate” module</td>
		<td>❌️ no support of “backup and migrate” module</td>
		<td>✅</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Apache Solr</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Free Apache Solr</strong></td>
		<td>✅ free Apache Solr for every site</td>
		<td>⚠️ free, but available only on Professional, Business and Elite.</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td><strong>Custom configurations for Apache Solr</strong></td>
		<td>✅ custom configurations possible. Easy testing inside Local Docker Development</td>
		<td>❌️ No custom configurations, no stopwords, no multilingual.</td>
		<td>⚠️ Custom configurations only on Enterprise plan</td>
		<td>⚠️ Custom configurations only on Enterprise plan</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Crons</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td><strong>Drush Cron</strong></td>
		<td>✅ fully customizable, up to 1 minute crons</td>
		<td>⚠️ forced to run once an hour, no possibility to set lower times</td>
		<td>✅ fully customizable, up to 1 minute crons</td>
		<td>✅ fully customizable, minimum 5 minute crons</td>
	</tr>
	<tr>
		<td><strong>Custom Crons scripts</strong></td>
		<td>✅</td>
		<td>❌️ </td>
		<td>✅</td>
		<td>✅</td>
	</tr>
</tbody>
</table>