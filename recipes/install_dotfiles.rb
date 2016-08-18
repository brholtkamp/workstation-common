#
# Cookbook Name:: workstation-common
# Recipe:: install_dotfiles
#

node['workstation']['dotfiles'].each do |file|
  cookbook_file "#{node['workstation']['home']}/.#{file}" do
    source file
    owner node['workstation']['user']
  end
end

template "#{node['workstation']['home']}/.gitconfig" do
  source 'gitconfig.erb'
  variables name: node['workstation']['name'], email: node['workstation']['email']
  owner node['workstation']['user']
end
