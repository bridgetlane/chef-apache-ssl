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

if node['default-ssl']['data_bags']
  keys = data_bag_item('keys', 'keys')
  certificate = keys['certificate']
  key = keys['key']

  template '/etc/ssl/certs/ssl-cert-snakeoil.pem' do
    source 'apache.crt.erb'
    owner 'root'
    group 'root'
    mode '0600'
    variables(
      certificate: certificate
    )
    action :create
  end

  template '/etc/ssl/private/ssl-cert-snakeoil.key' do
    source 'apache.key.erb'
    owner 'root'
    group 'root'
    mode '0600'
    variables(
      key: key
    )
    action :create
  end

  execute 'reload apache2' do
    action :nothing
    notifies :reload, 'service[apache2]', :delayed
  end

end
