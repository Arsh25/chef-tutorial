#
# Cookbook:: cookbook
# Recipe:: users
#
# Copyright:: 2021, Arsh Chauhan, MIT.

node['cookbook']['users']['all_users'].each do |u|
  user u do
    manage_home true
  end
end

node['cookbook']['users']['unauthorized_users'].each do |u|
  user u do
    action :remove
  end
end

group 'Dumbledore\'s Army' do
  append true
  group_name 'da'
  members node['cookbook']['users']['dumbledore_army']
end
