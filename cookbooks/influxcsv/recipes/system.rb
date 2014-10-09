include_recipe "git"

group "#{node[:influxcsv][:group]}"

user "#{node[:influxcsv][:user]}" do
  shell "/bin/false"
  gid "#{node[:influxcsv][:group]}"
  action :create
end

directory "#{node[:influxcsv][:deploy_dir]}/shared" do
  recursive true
  owner "#{node[:influxcsv][:user]}"
  group "#{node[:influxcsv][:group]}"
end
