#
# Cookbook Name:: workstation-common
# Recipe:: make_zsh_default
#

# Set ZSH as the main shell
user node['workstation']['user'] do
  action :modify
  shell '/usr/bin/zsh'
end
