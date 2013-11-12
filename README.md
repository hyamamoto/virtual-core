Virtual Core Project
====================

Virtual Core Project aims to provide super compact software platforms as a 'single purpose operation system' for virtualized environments. They are based on Tiny Core Linux. The smallest disk image is 12Mb in size and runs on a Vagrant/Virtualbox pair.

### Downloadables

#### [0.4.0 ( Core, Tiny Core )](https://github.com/hyamamoto/virtual-core/releases/tag/0.4.0)

##### **Core**  
* Desc.: Pure and stable. Text mode only. 
* Files : [Vagrantfile](https://github.com/hyamamoto/virtual-core/releases/download/0.4/Vagrantfile),  [vcore-0.4-i486-core5.0.2.box](https://github.com/hyamamoto/virtual-core/releases/download/0.4/vcore-0.4-i486-core5.0.2.box)
* Build Date: Nov/12/2013
* Based on: Micro Core 5.0.2 i386, Linux kernel 3.8.10
* Packed for: Vagrant 1.3.5 with Virtualbox 4.3.2 
* VM Spec    : 1 cpu / 256M mem / 512M hdd (default) 
* User/Pass  : tc/vagrant 
* Box Size : 12.27M 
* Box MD5: 9edc4ebfc192857cee04d45c2753ef6f 

##### **Core 64bit**
* Desc.: Text mode only.  Additional packages for 64bit Core5 are not stable yet. Take care.
* Files : [vcore-0.4-amd64-core5.0.2.box](https://github.com/hyamamoto/virtual-core/releases/download/0.4/vcore-0.4-amd64-core5.0.2.box)
* Build Date: Nov/12/2013
* Based on: Micro Core 5.0.2 x86_64 *release_candidates*, Linux kernel 3.8.10
* Packed for: Vagrant 1.3.5 with Virtualbox 4.3.2 
* VM Spec    : 1 cpu / 256M mem / 512M hdd (default) 
* User/Pass  : tc/vagrant 
* Box Size : 21.86M 
* Box MD5: 5bacb2e4b2d3cdf8c4ba8bb9e1494cc2 

##### **Tiny Core**
* Desc.: X-Window Desktop is up, and packages like Chromium and OfficeOffice are ready to be installed. 
* Files : [Vagrantfile](https://github.com/hyamamoto/virtual-core/releases/download/0.4/Vagrantfile.tinycore)  (Rename after download), [vcore-0.4-x486-tinycore5.0.2.box](https://github.com/hyamamoto/virtual-core/releases/download/0.4/vcore-0.4-i486-tinycore5.0.2.box)
* Build Date: Nov/12/2013
* Based on: Tiny Core 5.0.2 i386, Linux kernel 3.8.10,  fwdm_projects
* Packed for: Vagrant 1.3.5 with Virtualbox 4.3.2 
* VM Spec    : 1 cpu / 256M mem / 512M hdd (default) 
* User/Pass  : tc/vagrant 
* Box Size : 26.93M 
* Box MD5: d03b110869db7a24b3f25a93873d7a55 

#### [0.1.1 ( Core )](https://github.com/hyamamoto/virtual-core/releases/tag/0.1.1)

#### [0.1.0 ( Core )](https://github.com/hyamamoto/virtual-core/releases/tag/0.1.0)

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
