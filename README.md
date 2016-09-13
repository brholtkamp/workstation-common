# workstation-common

The common cookbook that helps manage the various OS cookbooks in the system.  This cookbook is responsible for all of the shared files that are platform agnostic and common functionality between all OS'.

# Recipes

- `default`: Will register [chef-client](https://github.com/chef-cookbooks/chef-client) as a service to run on the node.
- `copy_files`: Will copy files from `node['workstation']['files']` and `node['workstation']['directories']` to the node.
- `install_dotfiles`: Will copy dotfiles and generate a `.gitconfig` in the user's home directory.
- `make _zsh_default`: Will make the user's default shell [zsh]("https://zsh.org").
- `run_commands`: Will run commands from `node['workstation']['commands']`.

# Attributes
- `node['workstation']['email']`: The user's email address.
- `node['workstation']['user']`: The user's username.
- `node['workstation']['name']`: The user's real name.
- `node['workstation']['home']`: The path to the user's home folder.
- `node['workstation']['file_cookbook']`: Cookbook to source files from.
- `node['workstation']['commands']`: The list of commands to run on the node.
- `node['workstation']['directories']`: The list of directories to copy onto the node.
- `node['workstation']['files']`: The list of files to copy onto the node.
- `node['workstation']['dotfiles']`: The list of dotfiles to copy onto the node

- `node['chef_client']['interval']`: The interval in seconds to run the chef-client service on.

## OS-dependent Attributes

- `node['workstation']['applications']`: The list of applications to feed to the OS cookbooks.
- `node['workstation']['packages']`: The list of packages to feed to the OS cookbooks.