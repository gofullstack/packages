#!/bin/sh

cd ~/rpmbuild
QA_RPATHS="0xFFFF" rpmbuild -ba SPECS/ruby-enterprise.spec

