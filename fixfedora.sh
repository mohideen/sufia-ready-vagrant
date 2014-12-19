#!/usr/bin/env bash

curl -X PUT "http://localhost:8080/fcrepo/rest/root"
curl -X PUT "http://localhost:8080/fcrepo/rest/root/test"
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@/vagrant/indexing.rdf" "http://localhost:8080/fcrepo/rest/root"
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@/vagrant/roottitle.rdf" "http://localhost:8080/fcrepo/rest/root"
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@/vagrant/indexing.rdf" "http://localhost:8080/fcrepo/rest/root/test"
curl -X PATCH -H "Content-Type: application/sparql-update" --data-binary "@/vagrant/title.rdf" "http://localhost:8080/fcrepo/rest/root/test"

