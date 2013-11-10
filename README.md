Virtual Core Project
====================

Virtual Core Linux project aims to build a compact 
platform for 'Single purpose operation systems' for
virtualized environments. They're based on cutomized
Tiny/Micro Core Linux. Current disk images are packed
for Vagrant/Virtualbox pair, and the smallest image
size is 12Mb. 


### Downloadables

#### [**Core** 0.1.1](https://github.com/hyamamoto/virtual-core/releases/tag/0.1.1)

##### **Core**  
* Files : [Vagrantfile](https://github.com/hyamamoto/virtual-core/releases/download/0.1.1/Vagrantfile),  [vcore-tc.5.0.2-core-i386.box](https://github.com/hyamamoto/virtual-core/releases/download/0.1.1/vcore-tc.5.0.2-core-i386.box)
* Build Date: Nov/10/2013
* Based on: Tiny Core Linux 5.0.2 i386
* Tested on: Vagrant 1.3.5 with Virtualbox 4.3.2 
* VM Spec    : 1 cpu / 256M mem / 512M hdd (default) 
* User/Pass  : tc/vagrant 
* Box Size : 12.27M 
* Box MD5: bd7ef3c2e72f83170766c807383c1b08 

#### **Core 64**
* Files : [vcore-tc.5.0.2-core-i386.box](https://github.com/hyamamoto/virtual-core/releases/download/0.1.1/vcore-tc.5.0.2-core-amd64.box)
* Build Date: 2013/11/10
* Based on: Tiny Core Linux 5.0.2 x86_64 *release_candidates*
* Tested on: Vagrant 1.3.5 with Virtualbox 4.3.2 
* VM Spec    : 1 cpu / 256M mem / 512M hdd (default) 
* User/Pass  : tc/vagrant 
* Box Size : 21.86M 
* Box MD5: f29ace82e656f727fcba5b9b3b9aff0d 


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
