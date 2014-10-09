include_recipe "nginx"

template "#{node['nginx']['dir']}/sites-available/influxcsv" do
  source 'nginx_influxcsv.erb'
  owner  'root'
  group  node['root_group']
  mode   '0644'
  notifies :reload, 'service[nginx]'
end

nginx_site 'influxcsv'
