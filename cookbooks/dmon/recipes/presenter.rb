#
# Cookbook Name:: dmon
# Recipe:: presenter
#
# Copyright (c) 2016 Bogdan-Constantin Irimie, All Rights Reserved.

# Download remote archive.
remote_file node['dmon']['presenter']['archive_path'] do
    source "#{node['dmon']['presenter']['remote_location']}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

# Extract the archive.
execute 'extract_presenter' do
    command "tar -xvzf #{node['dmon']['presenter']['archive_path']}"
    cwd "#{node['dmon']['presenter']['deployment_directory']}"
end

# Remove the archive.
file node['dmon']['presenter']['archive_path'] do
    action :delete
end

# Create specs_monitoring_nmap_presenter/etc directory if it does not exit
directory node['dmon']['presenter']['etc_directory'] do
    action :create
    not_if {::File.exists?("#{node['dmon']['presenter']['etc_directory']}")}
end

# Create config file.
template node['dmon']['presenter']['conf_file'] do
    action :create
    source 'presenter.conf.properties.erb'
end