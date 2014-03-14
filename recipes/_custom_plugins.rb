#
# Cookbook Name:: eol-collectd-wrapper
# Recipe:: _custom_plugins
#
# Copyright 2014, Woods Hole Marine Biological Laboratory
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

custom_defaults = data_bag_item('custom_defaults', 'config') rescue {}

monitor_defaults = custom_defaults['monitor'] || {}
node.default['monitor']['graphite_address'] = monitor_defaults['graphite_address'] || 'localhost'
node.default['monitor']['graphite_port'] = monitor_defaults['graphite_port'] || 2003

include_recipe 'collectd'

collectd_plugin 'write_graphite' do
  template 'write_graphite.conf.erb'
end

collectd_plugin 'logfile' do
  options log_level: 'info', file: '/var/log/collectd.log', timestamp: true
end
