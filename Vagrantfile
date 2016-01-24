# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config_path = "config/vagrant"

  config.vm.provider "virtualbox" do |v|
    v.memory = 16384 #4096
    v.cpus = 4 #2
  end

  config.ssh.forward_agent = true

  config.vm.provision :shell, path: "#{config_path}/build_dependency_setup.sh"
  config.vm.provision :shell, path: "#{config_path}/git_setup.sh"
  #config.vm.provision :shell, path: "#{config_path}/zsh_setup.sh"

  config.vm.provision :shell, path: "#{config_path}/nodejs_setup.sh"
  config.vm.provision :shell, path: "#{config_path}/install-rvm.sh", args: "stable", privileged: false
  config.vm.provision :shell, path: "#{config_path}/install-ruby.sh", args: "1.9.3", privileged: false
  config.vm.provision :shell, path: "#{config_path}/install-ruby.sh", args: "2.3.0 'bundler --no-rdoc --no-ri -q'", privileged: false
  config.vm.provision :shell, path: "#{config_path}/install-ruby.sh", args: "2.3.0 'rails --no-rdoc --no-ri -q -v 5.0.0.beta1'", privileged: false
  config.vm.provision :shell, path: "#{config_path}/install-ruby.sh", args: "2.3.0 'foreman --no-rdoc --no-ri -q'", privileged: false

  config.vm.provision :shell, path: "#{config_path}/imagemagick_setup.sh"
  config.vm.provision :shell, path: "#{config_path}/phantomjs_setup.sh"

  config.vm.provision :shell, path: "#{config_path}/sqlite_setup.sh"
  config.vm.provision :shell, path: "#{config_path}/postgresql_setup.sh"

  # PostgreSQL Server port
  config.vm.network "forwarded_port", host: 15432, guest: 5432

  # Default Rails server port
  config.vm.network "forwarded_port", host: 13000, guest: 3000

  # CAS Server Port
  config.vm.network :forwarded_port, host: 18443, guest: 8443       # forwarding CAS Server

  # Foreman server port
  config.vm.network "forwarded_port", host: 15000, guest: 5000

end
