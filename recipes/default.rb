#
# Cookbook Name:: workstation-common
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

node['workstation']['dotfiles'].each do |file|
  cookbook_file file
end
