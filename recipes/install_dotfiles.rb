#
# Cookbook Name:: workstation-common
# Recipe:: install_dotfiles
#

node['workstation']['dotfiles'].each do |file|
  cookbook_file "#{node['workstation']['home']}/.#{file}" do
    source file
  end
end

template "#{node['workstation']['home']}/.gitconfig" do
  source 'gitignore.erb'
  variables name: node['workstation']['name'], email: node['workstation']['email']
end
