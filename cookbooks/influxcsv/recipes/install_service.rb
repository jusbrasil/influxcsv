include_recipe 'supervisor'

supervisor_service "influxcsv" do
  command "#{node[:influxcsv][:virtualenv]}/bin/gunicorn influxcsv:app"
  action :enable
  directory node[:influxcsv][:home_dir]
  autostart true
  autorestart true
  user node[:influxcsv][:user]
  redirect_stderr true
  stdout_logfile "/var/log/influxcsv.log"
  stdout_logfile_maxbytes "10485760"
  stdout_logfile_backups 2
end
