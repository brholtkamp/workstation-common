#
# Cookbook Name:: workstation-common
# Recipe:: make_zsh_default
#

# Set ZSH as the main shell
execute 'switching shell to ZSH' do
    command "chsh -s $(which zsh) #{node['workstation']['user']}"
end
