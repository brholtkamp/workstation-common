#
# Cookbook Name:: workstation-common
# Recipe:: default
#

include_recipe 'workstation-common::install_dotfiles'

include_recipe 'chef-client::default'
