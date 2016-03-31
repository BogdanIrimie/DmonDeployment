#
# Cookbook Name:: dmon
# Recipe:: frontend
#
# Copyright (c) 2016 Bogdan-Constantin Irimie, All Rights Reserved.

# Install the required packages.
package "mos-oracle-java-jdk-8"
package "mos-mongodb-org"
package "mos-rabbitmq-server"

#Start RabbitMQ server.
service "mos-rabbitmq-server_start" do
    not_if do ::File.exists?("/var/run/rabbitmq/pid") end
    provider Chef::Provider::Service::Systemd
    service_name "rabbitmq-server"
    action :start
end

#Create RabbitMQ user if it does not exist.
bash 'create_rabbitmq_user' do
    user "root"
    code <<-EOH
        if [[ $(rabbitmqctl list_users) == *"bogdan"* ]]
        then
          echo "User bogdan exists, no further action is required."
        else
          rabbitmqctl add_user bogdan constantin
          rabbitmqctl set_user_tags bogdan administrator
          rabbitmqctl set_permissions -p / bogdan ".*" ".*" ".*"
          echo "New user bogdan was created."
        fi
    EOH
end

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

# Create specs_monitoring_nmap_frontend/etc directory if it does not exit.
directory node['dmon']['frontend']['etc_directory'] do
    action :create
    not_if {::File.exists?("#{node['dmon']['frontend']['etc_directory']}")}
end

# Create config file.
template node['dmon']['frontend']['conf_file'] do
    action :create
    source 'frontend.conf.properties.erb'
end
