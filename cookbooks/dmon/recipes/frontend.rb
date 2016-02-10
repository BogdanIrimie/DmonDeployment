# Download remote archive.
remote_file node['dmon']['frontend']['archive_path'] do
    source 'https://bitbucket.org/specs-team/specs-monitoring-nmap/downloads/specs_monitoring_nmap_frontend.tar.gz'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    # not_if {::File.exists?("~/specs_monitoring_nmap_frontend.tar.gz") }
end

# Extract the archive.
execute 'extract_frontend' do
    command "tar -xvzf #{node['dmon']['frontend']['archive_path']}"
    cwd "#{node['dmon']['deployment_directory']}/specs_monitoring_nmap_frontend"
end

# Remove the archive.
file node['dmon']['frontend']['archive_path'] do
    action :delete
end