#
# Cookbook Name:: dmon
# Recipe:: mongodb
#
# Copyright (c) 2016 Bogdan-Constantin Irimie, All Rights Reserved.

# Install the required packages.
package "mongodb-org"

# Start MongoDB.
service "mos-mongodb-start" do
  not_if do ::File.exists?("/var/run/mongodb/mongod.pid") end
  provider Chef::Provider::Service::Systemd
  service_name "mongod"
  action :start
end
