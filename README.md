Ansible RVM role
===

This Ansible role installs RVM as root and the required ruby version. If user isn't root (executing without sudo) then RVM will be installed to the user home directory, but you need to change pathes to it own RVM through variables `rvm.root` and `rvm.init_script`.

Requirements
------------
Tested with CentOS 6.5, Debian 6, 7, Fedora 18, 19, 20, Ubuntu 10.04, 12.04, 13.10

Role Variables
--------------
- `rvm.ruby_version` per default set to `ruby-2.1.2`
- `rvm.url` per default set to `https://get.rvm.io`
- `rvm.root` per default set to `/usr/local/rvm`
- `rvm.init_script` per default set to `/etc/profile.d/rvm.sh`

The latest two variables have presented values because installation runs with root permissions by default (if you passed `-s` option when you're running your playbook)

License
-------
Licensed under [MIT](https://github.com/newmen/rvm/blob/master/LICENSE). Do what you want with it.
