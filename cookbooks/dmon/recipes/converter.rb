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