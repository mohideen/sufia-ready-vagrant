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

----

TODO: Complete instructions on how to install a working Sufia in this vagrant box. 

