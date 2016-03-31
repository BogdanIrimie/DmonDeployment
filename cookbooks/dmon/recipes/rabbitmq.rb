#
# Cookbook Name:: dmon
# Recipe:: rabbitmq
#
# Copyright (c) 2016 Bogdan-Constantin Irimie, All Rights Reserved.

#Install RabbitMQ package.
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

# Install plugin for delayed messages.
