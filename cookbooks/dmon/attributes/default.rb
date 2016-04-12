
# RabbitMQ
default['dmon']['rabbitmq']['remote_location'] = 'http://www.rabbitmq.com/community-plugins/v3.6.x/rabbitmq_delayed_message_exchange-0.0.1.ez'
default['dmon']['rabbitmq']['plugin_path'] = '/usr/lib/rabbitmq/lib/rabbitmq_server-3.6.0/plugins/rabbitmq_delayed_message_exchange-0.0.1.ez'

# FrontEnd
default['dmon']['frontend']['remote_location'] = 'https://bitbucket.org/specs-team/specs-monitoring-nmap/downloads/specs_monitoring_nmap_frontend.tar.gz'
default['dmon']['frontend']['archive_path'] = '/root/specs_monitoring_nmap_frontend.tar.gz'
default['dmon']['frontend']['deployment_directory'] = '/root'
default['dmon']['frontend']['component_home_directory'] = '/root/specs_monitoring_nmap_frontend'
default['dmon']['frontend']['etc_directory'] = '/root/specs_monitoring_nmap_frontend/etc'
default['dmon']['frontend']['conf_file'] = '/root/specs_monitoring_nmap_frontend/etc/conf.properties'

# Start FrontEnd
default['start_frontend']['config_file'] = '/etc/sysconfig/frontend_config'
default['start_frontend']['home'] = '/root/specs_monitoring_nmap_frontend'
default['start_frontend']['systemd_service'] = '/etc/systemd/system/frontend.service'

#Scheduler
default['dmon']['scheduler']['remote_location'] = 'https://bitbucket.org/specs-team/specs-monitoring-nmap/downloads/specs_monitoring_nmap_scheduler.tar.gz'
default['dmon']['scheduler']['archive_path'] = '/root/specs_monitoring_nmap_sceduler.tar.gz'
default['dmon']['scheduler']['deployment_directory'] = '/root'
default['dmon']['scheduler']['component_home_directory'] = '/root/specs_monitoring_nmap_scheduler'
default['dmon']['scheduler']['etc_directory'] = '/root/specs_monitoring_nmap_scheduler/etc'
default['dmon']['scheduler']['conf_file'] = '/root/specs_monitoring_nmap_scheduler/etc/conf.properties'

# Scanner
default['dmon']['scanner']['remote_location'] = 'https://bitbucket.org/specs-team/specs-monitoring-nmap/downloads/specs_monitoring_nmap_scanner.tar.gz'
default['dmon']['scanner']['archive_path'] = '/root/specs_monitoring_nmap_scanner.tar.gz'
default['dmon']['scanner']['deployment_directory'] = '/root'
default['dmon']['scanner']['component_home_directory'] = '/root/specs_monitoring_nmap_scanner'
default['dmon']['scanner']['etc_directory'] = '/root/specs_monitoring_nmap_scanner/etc'
default['dmon']['scanner']['conf_file'] = '/root/specs_monitoring_nmap_scanner/etc/conf.properties'

# Converter
default['dmon']['converter']['remote_location'] = 'https://bitbucket.org/specs-team/specs-monitoring-nmap/downloads/specs_monitoring_nmap_converter.tar.gz'
default['dmon']['converter']['archive_path'] = '/root/specs_monitoring_nmap_converter.tar.gz'
default['dmon']['converter']['deployment_directory'] = '/root'
default['dmon']['converter']['component_home_directory'] = '/root/specs_monitoring_nmap_converter'
default['dmon']['converter']['etc_directory'] = '/root/specs_monitoring_nmap_converter/etc'
default['dmon']['converter']['conf_file'] = '/root/specs_monitoring_nmap_converter/etc/conf.properties'

# Presenter
default['dmon']['presenter']['remote_location'] = 'https://bitbucket.org/specs-team/specs-monitoring-nmap/downloads/specs_monitoring_nmap_presenter.tar.gz'
default['dmon']['presenter']['archive_path'] = '/root/specs_monitoring_nmap_presenter.tar.gz'
default['dmon']['presenter']['deployment_directory'] = '/root'
default['dmon']['presenter']['component_home_directory'] = '/root/specs_monitoring_nmap_presenter'
default['dmon']['presenter']['etc_directory'] = '/root/specs_monitoring_nmap_presenter/etc'
default['dmon']['presenter']['conf_file'] = '/root/specs_monitoring_nmap_presenter/etc/conf.properties'
