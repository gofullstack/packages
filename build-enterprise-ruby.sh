#!/bin/sh
#
# Build Enterprise Ruby RPMs
#
# TODO: Investigate QA_RPATHS workaround
#

yum -y groupinstall 'Development Tools'
yum -y install rpmdevtools readline-devel

rpmdev-setuptree
cd rpmbuild/
mv ~/ruby-enterprise.spec SPECS/

cd SOURCES
wget http://rubyforge.org/frs/download.php/71096/ruby-enterprise-1.8.7-2010.02.tar.gz
cd ..

QA_RPATHS="0xFFFF" rpmbuild -ba SPECS/ruby-enterprise.spec
