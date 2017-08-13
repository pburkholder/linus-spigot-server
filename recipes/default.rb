#
# Cookbook Name:: linus-spigot-server
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
mchome='/opt/minecraft_servers/default'

minecraft_depend 'dependencies' do
  install_all true
end

# ToDo: add 'world' property with url of zipped world
spigot_server 'default' do
    eula true
    action :create
end

bukkit_plugin 'WorldEdit' do
    servers 'default'
    action :install
end

#bukkit_plugin 'VoxelSniper' do
#    servers 'default'
#    action :install
#end

server_properties 'default' do
  settings({
    :motd => 'FCS Gameathon Minecraft Severs',
    :enable_command_block => true
  })
end

execute 'unzip_world' do
    cwd mchome
    command 'rm -rf world/; unzip gameathon_world.zip'
    creates "#{mchome}/world/linus_was_here"
    action :nothing
end

cookbook_file '/opt/minecraft_servers/default/gameathon_world.zip' do
    source 'gameathon_world.zip'
    notifies :run, 'execute[unzip_world]', :immediately
end

cookbook_file "#{mchome}/ops.json" do
    source 'ops.json'
end

directory mchome do
    recursive true
    owner 'chefminecraft'
    group 'chefminecraft'
end

minecraft_service 'default' do
    action [:enable, :start]
end
