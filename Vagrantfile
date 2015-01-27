# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "chef/centos-7.0"
  
  config.ssh.pty = true

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  config.vm.provider :aws do |aws, override|
    # Dummy Box 
    override.vm.box = "dummy"
    aws.keypair_name = ENV['AWS_KEYPAIR_NAME']
    override.ssh.private_key_path = ENV['AWS_PRIVATE_KEY_PATH']
    aws.security_groups = ENV['AWS_SECURITY_GROUPS']
    aws.instance_type = "m1.medium"
    aws.ami = "ami-e6ad348e"
    override.ssh.username = "ec2-user"
    aws.tags = {
      'Name' => 'Sufia Centos 7',
     }
  end
 
  config.vm.hostname = "sufia-ready"
  
  # Main web server
  config.vm.network "forwarded_port", guest: 80, host: 38000
  
  # Rails server
  config.vm.network "forwarded_port", guest: 3000, host: 33000

  # Tomcat
  config.vm.network "forwarded_port", guest: 8080, host: 38080

  #Fuseki
  config.vm.network "forwarded_port", guest: 3030, host: 33030 

  config.vm.provision :shell, :path => "upgrade.sh"

  config.vm.provision :shell, :path => "mariadb.sh"

  config.vm.provision :shell, :path => "vim.sh"

  config.vm.provision :shell, :path => "git.sh"

  config.vm.provision :shell, :path => "redis.sh"

  config.vm.provision :shell, :path => "ruby.sh"

  config.vm.provision :shell, :path => "tomcat_fedora_solr.sh"

  config.vm.provision :shell, :path => "imagemagick.sh"

  config.vm.provision :shell, :path => "fits.sh"

  #config.vm.provision :shell, :privileged => false, :path => "sufia/setup.sh"

  #config.vm.provision :shell, :privileged => false, :path => "sufia/start.sh"


end