#!/bin/sh

yum -y groupinstall 'Development Tools'
yum -y install rpmdevtools readline-devel openssl-devel

rpmdev-setuptree
cp SPECS/ruby-enterprise.spec ~/rpmbuild/SPECS/
cp SOURCES/* ~/rpmbuild/SOURCES/

