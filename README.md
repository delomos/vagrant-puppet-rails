Vagrant & Puppet for Rails
==========================

A Vagrant configuration that automates the setup of a development environment
for Rails applications (pretty much based on what we use for [geleyi](https://github.com/geleyi) development).

Originally based on [@zaiste](https://github.com/zaiste/vagrant-puppet-rails.git)

It is based on Ubuntu 12.04 and it contains:

* MySQL
* RVM
* ruby-1.9.3-p385
* Passenger
* Imagemagick

How to use
----------

Install [VirtualBox](https://www.virtualbox.org).

Install [Vagrant](http://vagrantup.com)

Install [Puppet](http://puppetlabs.com)

``` sh
gem install puppet
```
Install [librarian-puppet](http://librarian-puppet.com/)

``` sh
gem install librarian-puppet
```

Clone the repository you want to work with e.g.

``` sh
git clone https://github.com/delomos/vagrant-puppet-rails.git
cd vagrant-puppet-rails
```

Initialize modules

``` sh
librarian-puppet install
```

Boot the virtual machine with automatic provision

``` sh
λ vagrant up
```

Start the virtual machine (note, bundler is installed with RVM)

``` sh
vagrant ssh
cd /vagrant
bundle
passenger start
```


Credentials
------------------------
MySQL: 
database: rails_dev 
uname:root / pwd:local || uname:dev / pwd:local

IP: 198.162.19.87


**Rock on with lots of African Love!**