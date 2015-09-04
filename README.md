Ansible RVM role
===

This Ansible role installs RVM as root and the required ruby version. If user isn't root (executing without sudo) then RVM will be installed to the user home directory, but you need to change pathes to it own RVM through variables `rvm.root` and `rvm.init_script`.

Requirements
------------
Tested with CentOS 6.4, 6.5, 7.0, Debian 6.0.10, 7.8, 8.1, Fedora 18, 19, 20, 21, Ubuntu 10.04, 12.04, 13.10, 14.04, 14.10

Role Variables
--------------
- `rvm_install_type` per default set to `system` (valid values: `system`, `user`)
- `rvm_default_ruby_version` per default set to `ruby-2.2.2`
- `rvm_auto_update_rvm` per default set to `true`
- `rvm.url` per default set to `https://get.rvm.io`
- `rvm_root` per default set to `/usr/local/rvm`
- `rvm_init_script` per default set to `/etc/profile.d/rvm.sh`

The last two variables are set according to whether a `system`-wide install (Multi-User install), or a Single-User install has been chosen with `rvm_install_type`.

The playbook runs with root permissions by default if the `ansible_ssh_user` that is running your playbook has `sudo` privileges, and `rvm_install_type` is set to `system`.

When the playbook is run with `rvm_install_type = user`, the playbook will install RVM to the home directory of the `ansible_ssh_user`.  The defaults for the last two variables are then:

- `rvm_root`: `~/.rvm`
- `rvm_init_script`: `~/.rvm/scripts/rvm`

License
-------
Licensed under [MIT](https://github.com/newmen/rvm/blob/master/LICENSE). Do what you want with it.
