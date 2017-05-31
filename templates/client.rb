cookbook_path   "/root/chef-repo/cookbooks"
role_path '/root/chef-repo/roles'
data_bag_path  '/root/chef-repo/data_bags'
environment_path '/root/chef-repo/environments'
encrypted_data_bag_secret '/etc/chef'
environment 'production'
local_mode 'true'
node_name 'node'
node_path '/root/chef-repo/nodes'
log_level :info