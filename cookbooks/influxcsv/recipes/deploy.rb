deploy_revision node[:influxcsv][:deploy_dir] do
  repo node[:influxcsv][:git_url]
  migrate false
 
  symlink_before_migrate.clear
  create_dirs_before_symlink.clear
  purge_before_symlink.clear
  symlinks.clear

  before_restart do
    execute "install_requirements" do
      command "#{node[:influxcsv][:virtualenv]}/bin/pip install -r requirements.txt"
      cwd node[:influxcsv][:home_dir]
    end
  end
  notifies :restart, "supervisor_service[influxcsv]"
end
