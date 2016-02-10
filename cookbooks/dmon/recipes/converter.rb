#
# Cookbook Name:: dmon
# Recipe:: converter
#
# Copyright (c) 2016 Bogdan-Constantin Irimie, All Rights Reserved.

# Download remote archive.
remote_file node['dmon']['converter']['archive_path'] do
    source "#{node['dmon']['converter']['remote_location']}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

# Extract the archive.
execute 'extract_converter' do
    command "tar -xvzf #{node['dmon']['converter']['archive_path']}"
    cwd "#{node['dmon']['converter']['deployment_directory']}"
end

# Remove the archive.
file node['dmon']['converter']['archive_path'] do
    action :delete
end

# Create specs_monitoring_nmap_converter/etc directory if it does not exit
directory node['dmon']['frontend']['etc_directory'] do
    action :create
    not_if {::File.exists?("#{node['dmon']['frontend']['etc_directory']}")}
end