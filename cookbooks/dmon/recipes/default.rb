#
# Cookbook Name:: dmon
# Recipe:: default
#
# Copyright (c) 2016 Bogdan-Constantin Irimie, All Rights Reserved.

include_recipe 'dmon::frontend'
include_recipe 'dmon::scanner'
include_recipe 'dmon::converter'
include_recipe 'dmon::presenter'