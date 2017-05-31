#
# Cookbook Name:: linus-spigot-server
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

minecraft_depend 'dependencies' do
  install_all true
end

spigot_server 'default' do
    eula true
    action :create
end

bukkit_plugin 'WorldEdit' do
    servers 'default'
    action :install
end


minecraft_service 'default' do
    action [:enable, :start]
end
