# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "bogconst"
client_key               "#{current_dir}/BogdanIrimie.pem"
validation_client_name   "testchefbi-validator"
validation_key           "#{current_dir}/testchefbi-validator.pem"
chef_server_url          "https://api.chef.io/organizations/testchefbi"
cookbook_path            ["#{current_dir}/../cookbooks"]
