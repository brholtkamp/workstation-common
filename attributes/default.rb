default['workstation']['user'] = ENV['USER']
default['workstation']['home'] = ENV['HOME']
default['workstation']['packages'] = %w(git man tig vim zsh)
default['workstation']['dotfiles'] = %w(editorconfig vimrc zshrc)
default['workstation']['name'] = 'Brian Holtkamp'
default['workstation']['email'] = 'brholtkamp@gmail.com'

default['chef_client']['interval'] = 600
