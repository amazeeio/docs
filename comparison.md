# Comparison of amazee.io, Pantheon, Acquia Cloud, Platform.sh

We like our competitors and know that they provide an outstanding service.
This comparison is provided by amazee.io itself, we took careful care in researching the capabilities of our competitors, but we cannot guarantee that it is correct.
If you found a mistake, we're happy to fix it! You can find the original file [in our github repository](https://github.com/amazeeio/docs/blob/master/comparison.md) and send us a pull request.

<div style="overflow-x: scroll;">
	<table>
		<tbody>
			<tr>
				<td colspan="5"><h3>Hosting Stack</h3>
					The hosting stack runs all your code and is essential for the availability and performance of your Drupal site.
				</td>
			</tr>
			<tr>
				<th style="width: 20%"></th>
				<th style="width: 20%">amazee.io</th>
				<th style="width: 20%">Pantheon</th>
				<th style="width: 20%">Acquia Cloud</th>
				<th style="width: 20%">platform.sh</th>
			</tr>
			<tr>
				<td><strong>Drupal optimized hosting stack</strong></td>
				<td>✅</td>
				<td>✅</td>
				<td>✅</td>
				<td>⚠️ optimized stack available but some DevOps knowledge and configuration necessary, examples existing</td>
			</tr>
			<tr>
				<td><strong>Custom web server configurations</strong></td>
				<td>✅ custom configurations possible. Easy testing inside Local Docker Development</td>
				<td>❌️ no custom configurations</td>
				<td>❌️ no custom configurations</td>
				<td>⚠️ some customizability via ‘.platform.app.yaml’ file</td>
			</tr>
			<tr>
				<td><strong>Automatic scaling</strong></td>
				<td>✅ unlimited CPU and RAM, no maximum amount of requests</td>
				<td>⚠️ only on Elite plan, too many concurrent requests on smaller plans will cause service outages <a href="https://pantheon.io/docs/platform-resources/" target="_blank"><i>source</i></a></td>
				<td>⚠️ only on Enterprise plan, too many concurrent requests on smaller plans will cause service outages <a href="https://docs.acquia.com/cloud/arch/compare-dev-managed" target="_blank"><i>source</i></a></td>
				<td>⚠️ only on Enterprise plan, too many concurrent requests on smaller plans will cause service outages <a href="https://docs.platform.sh/discover/overview/pricing.html" target="_blank"><i>source</i></a></td>
			</tr>
				<td><strong>No pricing based on CPU and RAM</strong></td>
				<td>✅ pricing purely based on Hits, no maximum CPU or RAM, no resource capping</td>
				<td>❌️ each plan has max CPU and RAM resources <a href="https://pantheon.io/docs/platform-resources/" target="_blank"><i>source</i></a></td>
				<td>❌️ pricing based on CPU and RAM <a href="https://www.acquia.com/cloud-pricing" target="_blank"><i>source</i></a></td>
				<td>❌️ max RAM resources <a href="https://platform.sh/pricing/" target="_blank"><i>source</i></a></td>
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
				<td colspan="5"><h3>Locations</h3>
					Data privacy and protection laws sometimes force you to host in a specific country or even data center, therefore it is important where your Drupal Site is hosted.
				</td>
			</tr>
			<tr>
				<th style="width: 20%"></th>
				<th style="width: 20%">amazee.io</th>
				<th style="width: 20%">Pantheon</th>
				<th style="width: 20%">Acquia Cloud</th>
				<th style="width: 20%">platform.sh</th>
			</tr>
			<tr>
				<td><strong>Locations</strong></td>
				<td>anywhere in the world possible, existing servers in: Switzerland, USA, South Africa, UK, Spain, France, Germany, Netherlands, Turkey, Italy, Toronto, India</td>
				<td>US only</td>
				<td>Bound to Amazon AWS: US, Ireland, Japan, Singapore, Australia</td>
				<td>US and EU <a href="https://docs.platform.sh/user_guide/reference/public-ip-addresses.html" target="_blank"><i>source</i></a></td>
			</tr>
			<tr>
				<td><strong>On-premises Hosting possible</strong></td>
				<td>✅ any data center or cloud provider in the world, starting already with 1 instance</td>
				<td>❌️</td>
				<td>❌️</td>
				<td>✅ <a href="https://platform.sh/product/enterprise/on-premises-paas/" target="_blank"><i>source</i></a></td>
			</tr>
			<tr>
				<td colspan="5"><h3>Local Development</h3>
					The best and fastest way to develop a website is when it is running locally. So a good local development environment is key for efficient development of a website.
				</td>
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
				<td colspan="5"><h3>Drupal, PHP, Composer, Node.js</h3>
					Composer is the new way of managing external dependencies and is required by Drupal 8. <br />
					Node.js is the tool of choice for Frontend build systems. Tools like gulp are built on Node.js and allow modern and faster development cycles.
				</td>
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
				<td colspan="5"><h3>SSL Certificates &amp; HTTPs</h3>
					The Internet can be a dangerous place and only with HTTPs you can be sure that nobody steals your login credentials or passwords.
				</td>
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
				<td colspan="5"><h3>Caching</h3>
					Caching is essential for any Drupal site, as it allows Drupal to focus on the hard tasks and leave serving of assets to the caching system.
				</td>
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
				<td>✅ Varnish 4, definable max-caching time</td>
				<td>✅ Varnish, maximum caching of 24h</td>
				<td>✅ Varnish 3</td>
				<td>✅ no Varnish but HTTP Caching on nginx level, maximum caching of 15min (⚠️)</td>
			</tr>
			<tr>
				<td><strong>Cache purging from Drupal</strong></td>
				<td>✅ via varnish, expire or purge module</td>
				<td>❌️ no purging from Drupal</td>
				<td>✅ via Acquia Purge Module</td>
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
				<td colspan="5"><h3>SSH &amp; Remote Access</h3>
					Having access to the server that runs the Drupal site can be very important in order to find bugs, execute special tasks or just test something real fast.
				</td>
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
				<td>✅ sftp, rsync</td>
			</tr>
			<tr>
				<td colspan="5"><h3>Git</h3>
					Git is the tool of choice if it comes to source code repositories, but multiple Git hosting solutions exist and everybody has it's own favorite.
				</td>
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
				<td>✅ by default, full support for GitHub, Github Enterprise, Bitbucket, Gitlab CE, Gitlab EE, Gitlab.com and any other Git Server.</td>
				<td>❌️ only with custom built synchronization server or pushing into two git remotes</td>
				<td>❌️ only with custom built synchronization server or pushing into two git remotes</td>
				<td>⚠️ integration into GitHub and Bitbucket, other repositories only with custom built synchronization server or pushing into two git remotes</td>
			</tr>
			<tr>
				<td colspan="5"><h3>Development sites/environments &amp; Workflows</h3>
					Multiple development environments or sites allow proper testing of new functionality and efficient development cycles. But they can also be confining if they cannot be adapted to the developers needs.
				</td>
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
				<td><strong>Custom development, branching and merging work flows</strong></td>
				<td>✅ fully custom, no forced work flows, deployment of branches</td>
				<td>⚠️ code can be committed via git to dev and multidev environments, deployments to test and live environments only via UI or CLI.</td>
				<td>✅ fully custom, no forced work flows, deployment either via branches or tags selected in UI</td>
				<td>✅ fully custom, no forced work flows, deployment of branches</td>
			</tr>
			<tr>
				<td><strong>Synchronization of files and database between sites/environments</strong></td>
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
				<td>✅ possibility for web hooks inside of .amazeeio.yml file</td>
				<td>✅ via pantheon.yml file</td>
				<td>✅ via Acquia Cloud Hooks</td>
				<td>✅</td>
			</tr>
			<tr>
				<td colspan="5"><h3>Drush</h3>
					Drush makes development and managing of a Drupal site extremely easy and fast. Where Drush site-alias allows developers to interact with remote sites without needing to login into them.
				</td>
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
				<td><strong>Fully Automated Drush Site-Aliases</strong></td>
				<td>✅ no need for downloading new alias files by hand or run a CLI command</td>
				<td>⚠️ need to download new Drush Site-Aliases via UI or CLI</td>
				<td>⚠️ need to download new Drush Site-Aliases via UI or CLI</td>
				<td>⚠️ need to create new Drush Site-Aliases via CLI</td>
			</tr>
			<tr>
				<td colspan="5"><h3>Xdebug, Blackfire, New Relic</h3>
					Xdebug allows step-by-step debugging of a Drupal request and is sometimes the only way in finding and fixing an issue. <br />
					Blackfire allows to find performance bottlenecks in a Drupal Site. <br />
					New Relic gives you insights into the performance of your Drupal site over time and after deployments.
				</td>
			</tr>
			<tr>
				<th style="width: 20%"></th>
				<th style="width: 20%">amazee.io</th>
				<th style="width: 20%">Pantheon</th>
				<th style="width: 20%">Acquia Cloud</th>
				<th style="width: 20%">platform.sh</th>
			</tr>
			<tr>
				<td><strong>Xdebug on development or production sites/environments</strong></td>
				<td>✅ remote Xdebug via ssh tunnel</td>
				<td>❌️ no Xdebug</td>
				<td>⚠️ needs to be enabled first</td>
				<td>✅ remote Xdebug via ssh tunnel</td>
			</tr>
			<tr>
				<td><strong>Blackfire on development or production sites/environments</strong></td>
				<td>✅ Blackfire available</td>
				<td>❌️ no Blackfire</td>
				<td>❌️ no Blackfire</td>
				<td>✅ Blackfire available</td>
			</tr>
			<tr>
				<td><strong>New Relic</strong></td>
				<td>✅ free New Relic Pro</td>
				<td>✅ free New Relic Pro</td>
				<td>⚠️ only NewRelic Lite</td>
				<td>❌️ no New Relic</td>
			</tr>
			<tr>
				<td colspan="5"><h3>Support &amp; SLAs</h3>
					Support gives you help right when you need it and SLAs allow you to sleep better, because you know that somebody is watching your Drupal sites.
				</td>
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
				<td colspan="5"><h3>Backups</h3>
					Things can go wrong and so it is important to have Backup ready. Automated backups ensure that backups are created automatically and without the need to think about them. <br />
					Saving a backup outside of the hosting provider, ensures that you have a backup even if the hosting provider makes a mistake.
				</td>
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
				<td><strong>Support for external (Amazon S3, Dropbox, etc.) backups via “backup and migrate” module</strong></td>
				<td>✅ full support to save backups externally. Custom crons provide even more flexibility.</td>
				<td>⚠️ “backup and migrate” module not recommended</td>
				<td>❌️ no support of “backup and migrate” module</td>
				<td>✅</td>
			</tr>
			<tr>
				<td colspan="5"><h3>Apache Solr</h3>
					Apache Solr allows Drupal to build fast and rich search experiences. In some cases it is even needed to have a custom Solr configurations in order to make sure that the search does exactly what you need.
				</td>
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
				<td>❌️ No custom configurations, no stop words, no multilingual.</td>
				<td>⚠️ Custom configurations only on Enterprise plan</td>
				<td>⚠️ Custom configurations only on Enterprise plan</td>
			</tr>
			<tr>
				<td colspan="5"><h3>Crons</h3>
					Running the Drush Cron regularly is vital for any Drupal site and once per hour should be enough. In some cases though you need it more often or custom cron scripts to ensure your Drupal site runs correctly.
				</td>
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
</div>