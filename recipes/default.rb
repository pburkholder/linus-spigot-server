#
# Cookbook Name:: linus-spigot-server
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'apt::default'

minecraft_depend 'dependencies' do
  install_all true
end

spigot_server 'default' do
    eula true
    action :create
end

minecraft_service 'default' do
    action [:enable, :start]
end
