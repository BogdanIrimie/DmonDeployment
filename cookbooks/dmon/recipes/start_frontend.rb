#
# Cookbook Name:: dmon
# Recipe:: start_frontend
#
# Copyright (c) 2016 Bogdan-Constantin Irimie, All Rights Reserved.

# Create config file.
file node['start_frontend']['config_file']  do
  action :create
  content "export FRONTEND_HOME=#{node['start_frontend']['home']}"
  not_if {::File.exists?("#{node['start_frontend']['config_file']}")}
end

# Start FrontEnd component using systemd.
