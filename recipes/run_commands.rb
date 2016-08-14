#
# Cookbook Name:: workstation-common
# Recipe:: run_commands
#

node['workstation']['commands'].each do |command|
  execute "executing #{command}" do
    command command
    user node['workstation']['user']
  end
end
