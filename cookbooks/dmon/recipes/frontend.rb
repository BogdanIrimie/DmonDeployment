#
# Cookbook Name:: dmon
# Recipe:: frontend
#
# Copyright (c) 2016 Bogdan-Constantin Irimie, All Rights Reserved.

# Download remote archive.
remote_file node['dmon']['frontend']['archive_path'] do
    source "#{node['dmon']['frontend']['remote_location']}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    # not_if {::File.exists?("~/specs_monitoring_nmap_frontend.tar.gz") }
end

# Extract the archive.
execute 'extract_frontend' do
    command "tar -xvzf #{node['dmon']['frontend']['archive_path']}"
    cwd "#{node['dmon']['frontend']['deployment_directory']}"
end

# Remove the archive.
file node['dmon']['frontend']['archive_path'] do
    action :delete
end