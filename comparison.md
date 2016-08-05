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
		<td>Drupal optimized hosting Stack**</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
		<td>⚠️ some DevOps knowledge and configuratin necessary, examples existing</td>
	</tr>
	<tr>
		<td>Custom webserver configurations</td>
		<td>✅ custom configurations possible. Easy testing inside Local Docker Development</td>
		<td>❌️ no custom configurations</td>
		<td>❌️ no custom configurations</td>
		<td>⚠️ some customizability via ‘.platform.app.yaml’ file</td>
	</tr>
	<tr>
		<td>On-demand server elasticity</td>
		<td>✅</td>
		<td>✅</td>
		<td>⚠️ only on Enterprise plan</td>
		<td>⚠️ only on Enterprise plan</td>
	</tr>
	<tr>
		<td>Automated security updates of OS and Services</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td>24x7 infrastructure and application monitoring</td>
		<td>✅</td>
		<td>⚠️ only on Elite plan</td>
		<td>⚠️ only on Enterprise plan</td>
		<td>⚠️ only on Enterprise plan</td>
	</tr>
	<tr>
		<td>Locations</td>
		<td>anywhere in the word possible, currently: Switzerland, USA, South Africa, UK</td>
		<td>US only</td>
		<td>Bound to Amazon AWS: US, Ireland, Japan, Singapore, Australia</td>
		<td>no information</td>
	</tr>
	<tr>
		<td>On-premises Hosting possible</td>
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
		<td>Local development provided</td>
		<td>✅ Local Docker Based Development - Windows, Linux, Mac</td>
		<td>✅ via kalabox, external tool with support for Pantheon - Windows, Linux, Mac</td>
		<td>✅ Acquia Dev Desktop - Windows, Mac - no Linux</td>
		<td>❌️</td>
	</tr>
	<tr>
		<td>Local development congruent to development and production sites</td>
		<td>✅ exactly the same services and configurations like development and production sites</td>
		<td>❌️ different services and configurations, no Varnish locally</td>
		<td>❌️ different services and configurations, no Varnish or Apache Solr locally</td>
		<td>❌️ no local development</td>
	</tr>
	<tr>
		<td colspan="5"><h3>Drupal and PHP</h3></td>
	</tr>
	<tr>
		<th style="width: 20%"></th>
		<th style="width: 20%">amazee.io</th>
		<th style="width: 20%">Pantheon</th>
		<th style="width: 20%">Acquia Cloud</th>
		<th style="width: 20%">platform.sh</th>
	</tr>
	<tr>
		<td>PHP Versions</td>
		<td>5.6, 7.0</td>
		<td>5.3, 5.4, 5.5, 5.6, 7.0</td>
		<td>5.6, 7.0</td>
		<td>5.6, 7.0, HHVM</td>
	</tr>
	<tr>
		<td>Drupal core &amp; contrib security updates</td>
		<td>✅ via Drop Guard (price reduction for <a href="http://amazee.io">amazee.io</a> clients)</td>
		<td>✅ when using Pantheon Drupal Version Drops</td>
		<td>⚠️ only enterprise or external service</td>
		<td>⚠️ only via external service</td>
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
		<td>Free SSL/HTTPs Support</td>
		<td>✅</td>
		<td>⚠️ extra costs</td>
		<td>⚠️ extra costs</td>
		<td>✅</td>
	</tr>
	<tr>
		<td>Free SSL Certificate provided</td>
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
		<td>Caching</td>
		<td>✅ Varnish 4, definable max-caching time, purging via varnish, expire or purge module</td>
		<td>✅ Varnish, maximum caching of 24h</td>
		<td>✅ Varnish 3</td>
		<td>✅ no Varnish but HTTP Caching on nginx level, maximum caching of 15min</td>
	</tr>
	<tr>
		<td>Cache purging from Drupal</td>
		<td>✅ via varnish, expire or purge module</td>
		<td>❌️ no purging from Drupal</td>
		<td>via Acquia Purge Module</td>
		<td>❌️ no purging from Drupal</td>
	</tr>
	<tr>
		<td>External Caching Systems (CDNs, Fastly)</td>
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
		<td>Shell access via SSH</td>
		<td>✅ authentication via ssh public key</td>
		<td>❌️ no shell access, only remote Drush commands</td>
		<td>✅ authentication via ssh public key</td>
		<td>✅ authentication via ssh public key</td>
	</tr>
	<tr>
		<td>File transfers</td>
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
		<td>Git support</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td>External hosted Git Repositories</td>
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
		<td>Separate development, staging, and production sites/environments</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td>Custom naming of development sites/environments</td>
		<td>✅ fully custom, based on git branch names</td>
		<td>⚠️ only multidev environments, default ones are called dev, test, live</td>
		<td>⚠️ only additional environments, default ones are called dev, staging, prod</td>
		<td>✅ fully custom, based on git branch names</td>
	</tr>
	<tr>
		<td>Custom development, branching and merging workflows</td>
		<td>✅ fully custom, no forced workflows, deployment of branches</td>
		<td>⚠️ code can be committed via git to dev and multidev enviornments, deployments to test and live environments only via UI or CLI.</td>
		<td>✅ fully custom, no forced workflows, deployment either via branches or tags selected in UI</td>
		<td>✅ fully custom, no forced workflows, deployment of branches</td>
	</tr>
	<tr>
		<td>Synchronisation of files and database between sites/environments</td>
		<td>✅ based on drush sql-sync and drush rsync commands</td>
		<td>✅ via UI or via CLI tool</td>
		<td>✅ via UI only</td>
		<td>✅ via UI or via CLI tool</td>
	</tr>
	<tr>
		<td>Cloud hooks / web hooks</td>
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
		<td>Drush support</td>
		<td>✅ full support of all commands</td>
		<td>⚠️ some commands not supported (like sql-sqlc, php-eval)</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td>Automated Drush Site-Aliases</td>
		<td>✅ no need for downloading new alias files by hand or run a CLI command</td>
		<td>⚠️ need to download new Drush Site-Aliases via UI or CLI</td>
		<td>⚠️ need to download new Drush Site-Aliases via UI or CLI</td>
		<td>⚠️ need to download new Drush Site-Aliases via UI or CLI</td>
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
		<td>SLA</td>
		<td>✅</td>
		<td>⚠️ only on Elite plan</td>
		<td>⚠️ only on Enterprise plan</td>
		<td>⚠️ only on Enterprise plan</td>
	</tr>
	<tr>
		<td>Support</td>
		<td>Slack, E-Mail, Website, Phone</td>
		<td>E-Mail, Website; Elite only: Phone</td>
		<td>E-Mail, Website; Enterprise only: Phone</td>
		<td>Slack, E-Mail, Website, Phone</td>
	</tr>
	<tr>
		<td>24x7 emergency phone support</td>
		<td>✅</td>
		<td>⚠️ only on Elite plan</td>
		<td>⚠️ only on Enterprise plan</td>
		<td>⚠️ only on Enterprise plan</td>
	</tr>
	<tr>
		<td>Drupal support</td>
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
		<td>Automated Backups</td>
		<td>✅ automated complete (files, code, db) backups. Daily backups kept for 1 week, weekly backups for 1 month</td>
		<td>✅ automated complete (files, code, db) backups. Daily backups kept for 1 week, weekly backups for 1 month</td>
		<td>⚠️ only automated database backups. Daily backups kept for 3 days. (longer internal backups but no access for clients)</td>
		<td>❌️ no automated backups, needs to be executed manually, backups kept for 14 days max</td>
	</tr>
	<tr>
		<td>Support for “backup and migrate” module</td>
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
		<td>Free Apache Solr</td>
		<td>✅ free Apache Solr for every site</td>
		<td>⚠️ free, but available only on Professional, Business and Elite.</td>
		<td>✅</td>
		<td>✅</td>
	</tr>
	<tr>
		<td>Custom configurations for Apache Solr</td>
		<td>✅ custom configurations possible. Easy testing inside Local Docker Development</td>
		<td>❌️ No custom configurations, no stopwords, no multilingual.</td>
		<td>⚠️ Custom configurations only on Enterprise plan</td>
		<td>⚠️ Custom configurations only on Enterprise plan</td>
	</tr>
</tbody>
</table>