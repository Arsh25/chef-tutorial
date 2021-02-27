#
# Cookbook:: cookbook
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

cookbook_file '/etc/ssh/sshd_config' do
  source 'sshd_config'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

include_recipe 'cookbook::users'
