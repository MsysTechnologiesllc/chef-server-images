if node['cloud_v2']['provider'] == 'gce'
	api_fqdn = node['cloud_v2']['public_ipv4']
	ipaddress = node['cloud_v2']['local_ipv4']
elsif node['cloud_v2']['provider'] == 'azure'
	api_fqdn = "#{node['hostname']}.cloudapp.net"
	ipaddress = node['ipaddress']
else
	api_fqdn = node['cloud_v2']['public_hostname']
	ipaddress = node['cloud_v2']['local_ipv4']
end

file '/etc/opscode/private-chef.rb' do
  content <<-EOH
api_fqdn '#{api_fqdn}'
dark_launch['actions'] = true
rabbitmq['vip'] = '#{ipaddress}'
rabbitmq['node_ip_address'] = '0.0.0.0'
EOH
end
