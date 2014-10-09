include_recipe "python"

python_virtualenv node[:influxcsv][:virtualenv] do
  interpreter "python2.7"
  owner node[:influxcsv][:user]
  group node[:influxcsv][:group]
  action :create
end

# target a virtualenv
python_pip "gunicorn" do
  virtualenv node[:influxcsv][:virtualenv]
end
