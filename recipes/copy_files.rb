#
# Cookbook Name:: workstation-common
# Recipe:: copy_files
#

node['workstation']['directories'].each do |path|
  remote_directory path do
    recursive true
    files_owner node['workstation']['user']
    owner node['workstation']['user']
  end
end

node['workstation']['files'].each do |file|
  cookbook_file file do
    owner node['workstation']['user']
  end
end
