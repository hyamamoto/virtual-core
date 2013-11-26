Virtual Core project (vCore)
====================

"Virtual Core" project aims to provide several Unix-based software platforms each to be run as single-purpose operation system on virtualized environments. They are based on Tiny Core Linux and the smallest box image is 12Mb in size runnable with  Vagrant/Virtualbox. There''re's been reports that they can run on QEmu as well.

### Available vCore Variants

#### [0.5 ( -core-c, -core, -core-python, -core-golang, -tinycore )](https://github.com/hyamamoto/virtual-core/releases/tag/0.5)

##### **-Core-c**  
* Desc.: Micro Core barebone. Nothing added. Text mode. (non-unicode, no locale)
* Files : [Vagrantfile](https://github.com/hyamamoto/virtual-core/releases/download/0.5/Vagrantfile-c),  [vcore-0.5-i486-core5.0.2-c.box](https://github.com/hyamamoto/virtual-core/releases/download/0.5/vcore-0.5-i486-core5.0.2-c.box)
* Build Date: Nov/27/2013
* Based on: Micro Core 5.0.2 i386, Linux kernel 3.8.10
* Packed for: Vagrant 1.3.5 with Virtualbox 4.3.2 
* Configuration : 1 cpu / 256M mem / 4G hdd (dynamically sized) 
* User/Pass  : tc/vagrant 
* Box Size : 12.38M 
* Box MD5: 7889845e36592e54c5b8035a96dc710c 

##### **-Core**  
* Desc.: Unicode enabled smallest barebone. Text mode. 
* Files : [Vagrantfile](https://github.com/hyamamoto/virtual-core/releases/download/0.5/Vagrantfile),  [vcore-0.5-i486-core5.0.2.box](https://github.com/hyamamoto/virtual-core/releases/download/0.5/vcore-0.5-i486-core5.0.2.box)
* Build Date: Nov/27/2013
* Based on: Micro Core 5.0.2 i386, Linux kernel 3.8.10
* Packed for: Vagrant 1.3.5 with Virtualbox 4.3.2 
* Configuration : 1 cpu / 256M mem / 4G hdd  (dynamically sized) 
* User/Pass  : tc/vagrant 
* Box Size : 12.54M 
* Box MD5: de3ce65f6e2b24fee7713b6c59c81fd1 

##### **-Core-Python2.7**  
* Desc.: To be the tiniest [Python](http://www.python.org/) 2.7.x environment with full-featured Vim, Jedi. Text mode. 
* Files : [Vagrantfile](https://github.com/hyamamoto/virtual-core/releases/download/0.5/Vagrantfile-python2.7),  [vcore-0.5-i486-core5.0.2-python2.7.box](https://github.com/hyamamoto/virtual-core/releases/download/0.5/vcore-0.5-i486-core5.0.2-python2.7.box)
* Build Date: Nov/27/2013
* Based on: Micro Core 5.0.2 i386, Linux kernel 3.8.10
* Packed for: Vagrant 1.3.5 with Virtualbox 4.3.2 
* Configuration : 1 cpu / 256M mem / 4G hdd  (dynamically sized) 
* User/Pass  : tc/vagrant 
* Box Size : 32.01M 
* Box MD5: f81f88a6112d2fa5289e0740bbdd37fd 

##### **-Core-Golang1.1**  
* Desc.: To be the tiniest [Go](http://golang.org/) 1.1.2 dev kit with full-featured Vim, GoCode. Text mode.
* Files : [Vagrantfile](https://github.com/hyamamoto/virtual-core/releases/download/0.5/Vagrantfile-golang1.1),  [vcore-0.5-i486-core5.0.2-golang1.1.box](https://github.com/hyamamoto/virtual-core/releases/download/0.5/vcore-0.5-i486-core5.0.2-golang1.1.box)
* Build Date: Nov/27/2013
* Based on: Micro Core 5.0.2 i386, Linux kernel 3.8.10
* Packed for: Vagrant 1.3.5 with Virtualbox 4.3.2 
* Configuration : 1 cpu / 738M mem / 4G hdd  (dynamically sized) 
* User/Pass  : tc/vagrant 
* Box Size : 82.60M 
* Box MD5: fc19eb80332394ae69f99f35774f2847 

##### **-TinyCore**
* Desc.: X-Window Desktop. Packages like Chromium and OpenOffice are ready for download. 
* Files : [Vagrantfile-tinycore](https://github.com/hyamamoto/virtual-core/releases/download/0.5/Vagrantfile-tinycore) , [vcore-0.5-i486-tinycore5.0.2.box](https://github.com/hyamamoto/virtual-core/releases/download/0.5/vcore-0.5-i486-tinycore5.0.2.box)
* Build Date: Nov/27/2013
* Based on: Tiny Core 5.0.2 i386, Linux kernel 3.8.10,  fwdm\_projects
* Packed for: Vagrant 1.3.5 with Virtualbox 4.3.2 
* Configuration : 1 cpu / 256M mem / 4G hdd (dyncmically sized) 
* User/Pass  : tc/vagrant 
* Box Size : 27.11M 
* Box MD5: f745278d2eedd401322470eed1e862c1 

#### [0.4 ( -core, -tinycore )](https://github.com/hyamamoto/virtual-core/releases/tag/0.4)

##### **-Core 64bit**
* Desc.: Text mode.  Additional packages for 64bit Core are not stable yet. Take care.
* Files : [vcore-0.4-amd64-core5.0.2.box](https://github.com/hyamamoto/virtual-core/releases/download/0.4/vcore-0.4-amd64-core5.0.2.box)
* Build Date: Nov/12/2013
* Based on: Corepure64 5.0.2 x86\_64 *release_candidates*, Linux kernel 3.8.10
* Packed for: Vagrant 1.3.5 with Virtualbox 4.3.2 
* Configuration : 1 cpu / 256M mem / 512M hdd 
* User/Pass  : tc/vagrant 
* Box Size : 21.86M 
* Box MD5: 5bacb2e4b2d3cdf8c4ba8bb9e1494cc2 

#### [0.1.1 ( -core )](https://github.com/hyamamoto/virtual-core/releases/tag/0.1.1)

#### 0.1.0 ( -core )

### Usage:

Download 'Vagrantfile' somewhere and hit

> $ vagrant up  
> $ vagrant ssh 


### Build

This project is currently in active development.  Build system will change frequently. Current build system is Packer ( used to be Veewee). 


### Testing now...

* Core + Python 2.7 + fabric ( working awesomely )


### Planned

* Desktop launcher
* VMware images
* Core + httpd (nginx or apache) + php : for testers
* Core + Dart + Spark + nginx (no advantage to be small ...)
* Core + Python + Gerrit
* Core + Ruby + Rails + MySQL

--
Hiroshi Yamamoto (higon@freepress.jp)
