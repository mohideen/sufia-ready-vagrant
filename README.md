sufia-ready-vagrant
==========

Vagrant for Sufia and Fedora 4 Development

Components installed: 

- Solr
- Fedora 4
- MariaDB *(No users are created yet, and install is not secured)*
- Redis 
- ImageMagick
- Ruby
- Fuseki
- Fits

Uses port forwarding:

[http://localhost:38000](http://localhost:38000) -> Port 80 

[http://localhost:38080/solr](http://localhost:38080/solr) -> Solr

[http://localhost:38080/fcrepo/rest](http://localhost:38080/fcrepo/rest) -> Fedora 4 REST API

[http://localhost:33030](http://localhost:33030) -> Fuseki

Fits is installed under `/opt/fits`. Solr and Fuseki should index the Fedora 4 repo automatically. 


------

 TODO: Complete instructions on how to install a working Sufia in this vagrant box.  

------

## Getting Started

Borrowed from [https://github.com/projecthydra-labs/sufia-vagrant](https://github.com/projecthydra-labs/sufia-vagrant) 

First install all of the dependencies (Git, VirtualBox, Vagrant), then `vagrant up` your new development environment. 

### Install Git

To grab a copy of sufia-ready-vagrant, which is hosted on github.com, you'll need git, the distributed version control system.  Here are [instructions on installing git](http://git-scm.com/book/en/Getting-Started-Installing-Git).

### Install VirtualBox

You will also need VirtualBox installed to run the virtual machine that runs sufia-ready-vagrant. Download packages and installation instructions can be found at https://www.virtualbox.org/wiki/Downloads.

### Install Vagrant

If you don't have Vagrant installed, here's how to remedy that:

  * Windows: follow the installation instructions on Vagrant's [downloads page](https://www.vagrantup.com/downloads).
  * Mac: With homebrew ```brew tap phinze/cask; brew install brew-cask; brew cask install vagrant``` _or_ follow the installation instructions on Vagrant's [downloads page](https://www.vagrantup.com/downloads).
  * Linux: use your favorite package manager to install packages for vagrant.

### Run sufia-ready-vagrant

    $ git clone https://github.com/cudevmaxwell/sufia-ready-vagrant.git
    $ cd sufia-ready-vagrant
    $ vagrant up

On Windows, you can also use [github for windows](https://windows.github.com/) and run vagrant from within the git shell.  

> `vagrant up` will take some time to complete the first time you launch it -- **no, really, maybe grab a cup of coffee and wait for this to complete!** 



