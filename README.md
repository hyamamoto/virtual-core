Virtual Core Project
====================

Virtual Core Linux project aims to build a compact 
platform for 'Single purpose operation systems' for
virtualized environments. They're based on cutomized
Tiny/Micro Core Linux. Current disk images are packed
for Vagrant/Virtualbox pair, and the smallest image
size is 12Mb. 


### Download

#### [**Core** 0.1.1 ( build on 2013/11/10 )](https://github.com/hyamamoto/virtual-core/releases/tag/0.1.1)

* Basebox : [Vagrantfile](https://github.com/hyamamoto/virtual-core/releases/download/0.1.1/Vagrantfile),  [vcore-tc.5.0.2-core-i386.box](https://github.com/hyamamoto/virtual-core/releases/download/0.1.1/vcore-tc.5.0.2-core-i386.box)
*  Based on: Tiny Core Linux 5.0.2
* Environment: Vagrant with Virtualbox 4.3.2
* VM Spec    : 1 cpu / 256M mem / 512M disk (default)
* User/pass  : tc/vagrant
* Box Size : 12.27M
* Box MD5: bd7ef3c2e72f83170766c807383c1b08

#### [**Core** 0.1.0 ( build on 2013/11/09 )](https://github.com/hyamamoto/virtual-core/releases/tag/0.1.0)


### Usage:

Download 'Vagrantfile' somewhere and hit

> $ vagrant up  
> $ vagrant ssh 


### Build

This project is currently in development.  Current build system is
Veewee but will be replaced soon. So for now ,pull the definitions
and build the image on Veewee.


### Planned

* Core + minimum Ruby or Python set : for Rails, Gerrit
* Core + httpd + php : for testers

--
Hiroshi Yamamoto (higon@freepress.jp)
