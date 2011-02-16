#!/bin/sh

yum -y groupinstall 'Development Tools'
yum -y install rpmdevtools readline-devel openssl-devel

rpmdev-setuptree
ln -s ~/ruby-enterprise-rpm/SPECS/ruby-enterprise.spec ~/rpmbuild/SPECS/
ln -s ~/ruby-enterprise-rpm/SOURCES/ruby-enterprise-1.8.7-2010.02.tar.gz ~/rpmbuild/SOURCES/

