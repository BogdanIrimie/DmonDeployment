#
# Cookbook Name:: dmon
# Recipe:: scheduler
#
# Copyright (c) 2016 Bogdan-Constantin Irimie, All Rights Reserved.

# Install the required packages
package "mos-oracle-java-jdk-8"
package "mos-mongodb-org"
package "mos-rabbitmq-server"

# Download remote archive.
remote_file node['dmon']['scheduler']['archive_path'] do
    source "#{node['dmon']['scheduler']['remote_location']}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

# Extract the archive.
execute 'extract_scheduler' do
    command "tar -xvzf #{node['dmon']['scheduler']['archive_path']}"
    cwd "#{node['dmon']['scheduler']['deployment_directory']}"
end

# Remove the archive.
file node['dmon']['scheduler']['archive_path'] do
    action :delete
end

# Create specs_monitoring_nmap_scheduler/etc directory if it does not exit
directory node['dmon']['scheduler']['etc_directory'] do
    action :create
    not_if {::File.exists?("#{node['dmon']['scheduler']['etc_directory']}")}
end

# Create config file.
template node['dmon']['scheduler']['conf_file'] do
    action :create
    source 'scheduler.conf.properties.erb'
end
