#
# Cookbook Name:: dmon
# Recipe:: scanner
#
# Copyright (c) 2016 Bogdan-Constantin Irimie, All Rights Reserved.

# Install the required packages
package "mos-oracle-java-jdk-8"
package "mos-mongodb-org"
package "mos-rabbitmq-server"
package "nmap"
# Download remote archive.
remote_file node['dmon']['scanner']['archive_path'] do
    source "#{node['dmon']['scanner']['remote_location']}"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

# Extract the archive.
execute 'extract_scanner' do
    command "tar -xvzf #{node['dmon']['scanner']['archive_path']}"
    cwd "#{node['dmon']['scanner']['deployment_directory']}"
end

# Remove the archive.
file node['dmon']['scanner']['archive_path'] do
    action :delete
end

# Create specs_monitoring_nmap_scanner/etc directory if it does not exit
directory node['dmon']['scanner']['etc_directory'] do
    action :create
    not_if {::File.exists?("#{node['dmon']['scanner']['etc_directory']}")}
end

# Create config file.
template node['dmon']['scanner']['conf_file'] do
    action :create
    source 'scanner.conf.properties.erb'
end