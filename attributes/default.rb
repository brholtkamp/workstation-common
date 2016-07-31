default['workstation']['user'] = ENV['USER']
default['workstation']['home'] = ENV['HOME']
default['workstation']['name'] = 'Brian Holtkamp'
default['workstation']['email'] = 'brholtkamp@gmail.com'

default['workstation']['packages'] = %w(git tig vim)
default['workstation']['dotfiles'] = %w(editorconfig vimrc zshrc)
default['workstation']['applications'] = []

default['chef_client']['interval'] = 600
