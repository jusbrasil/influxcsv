#
# Cookbook Name:: influxcsv
# Recipe:: default
#
include_recipe "influxcsv::system"
include_recipe "influxcsv::configure_virtualenv"
include_recipe "influxcsv::install_service"
include_recipe "influxcsv::install_webserver"
include_recipe "influxcsv::deploy"
