# Packages

These are packages (mostly rpm and deb) used by Cramer Development. We mainly use CentOS/RHEL 5 and Ubuntu LTS, so YMMV on other distros and versions. Most of these were built with [FPM](https://github.com/jordansissel/fpm).

## gearmand rpm
[Gearman](http://gearman.org) server. Only installs the binaries, nothing else.

Notes from installation:

    # https://launchpad.net/gearmand/trunk/0.24/+download/gearmand-0.24.tar.gz
    sudo yum install boost141 boost141-devel libevent libevent-devel
    ./configure
    # if configure fails because it can't find something related to Boost, do this:
    # export LDFLAGS="-L/usr/lib64/boost141"
    # then run ./configure again
    make
    mkdir /tmp/ginstall
    make install DESTDIR=/tmp/ginstall
    fpm -s dir -t rpm -n gearmand -v 0.24 -C /tmp/ginstall -p
    gearmand-VERSION_ARCH.rpm usr/local/bin usr/local/lib

## gearmand deb

[Gearman](http://gearman.org) server. Only installs the binaries, does not include any initscripts, log rotation, or anything else.

Notes from installation:

    # https://launchpad.net/gearmand/trunk/0.29/+download/gearmand-0.29.tar.gz
    sudo apt-get install -y libboost-dev libboost-program-options-dev libboost-thread-dev libdrizzle-dev libsqlite3-dev libmysqlclient-dev libtokyocabinet-dev
    ./configure
    ---
    Configuration summary for gearmand version 0.29

       * Installation prefix:       /usr
       * System type:               unknown-linux-gnu
       * Host CPU:                  x86_64
       * C Compiler:                gcc (Ubuntu 4.4.3-4ubuntu5.1) 4.4.3
       * Assertions enabled:        yes
       * Debug enabled:             no
       * Warnings as failure:       
       * Building with libsqlite3   yes
       * Building with libdrizzle   no
       * Building with libmemcached no
       * Building with libpq        no
       * Building with tokyocabinet yes
       * Building with libmysql     yes

    ---
    make
    make install DESTDIR=~/gearmand/build
    gem install fpm
    rm -f gearmand-0.29_x86_64.deb
    fpm -d "libboost-program-options1.40.0 (>= 1.40.0-4ubuntu4)" -d "libevent-1.4-2 (>= 1.4.13-stable-1)" -d "libtokyocabinet8 (>= 1.4.23)" -s dir -t deb -p gearmand-VERSION_x86_64.deb -n gearmand -v 0.29 -C build usr

## Ruby 1.9.2 rpms

* ruby-1.9.2p290-2.x86_64.rpm
* ruby-debuginfo-1.9.2p290-2.x86_64.rpm

Compiled from https://github.com/imeyer/ruby-1.9.2-rpm

## REE rpms

* ruby-enterprise-1.8.7-6.i386.rpm
* ruby-enterprise-1.8.7-6.x86_64.rpm
* ruby-enterprise-debuginfo-1.8.7-6.i386.rpm
* ruby-enterprise-debuginfo-1.8.7-6.x86_64.rpm
* ruby-enterprise-rubygems-1.3.7-6.i386.rpm
* ruby-enterprise-rubygems-1.3.7-6.x86_64.rpm

Compiled from https://github.com/jgoldschrafe/rpm-ruby-enterprise
