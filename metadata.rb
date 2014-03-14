name             'eol-collectd-wrapper'
maintainer       'Woods Hole Marine Biological Laboratory'
maintainer_email 'pleary@mbl.edu'
license          'Apache 2.0'
description      'Installs/Configures eol-collectd-wrapper'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

# use -> cookbook 'collectd', git: 'https://github.com/coderanger/chef-collectd.git'
# there is a bug fixed in the HEAD, but the version was not bumped
depends 'collectd'
# use -> cookbook 'collectd_plugins', git: 'https://github.com/Shopify/chef-collectd_plugins.git'
# this is a forked version of the original, and includes a plugin for measuring load
depends 'collectd_plugins'
# this is a un-documented dependency of recipe collectd::collectd_web
depends 'apache2'
