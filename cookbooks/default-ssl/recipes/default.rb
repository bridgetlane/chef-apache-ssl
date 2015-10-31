#
# Cookbook Name:: default-ssl
# Recipe:: default
#
# Copyright 2015, Bridget Lane
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe 'apache2'
include_recipe 'apache2::mod_ssl'

# sudo a2ensite default-ssl
# sudo service apache2 reload
apache_site 'default-ssl' do
  enable true
  notifies :reload, 'service[apache2]'
end
