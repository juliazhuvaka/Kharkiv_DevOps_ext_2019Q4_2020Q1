## Task 2.2. Part 1. Virtual Box

### Oracle VM Virtual Box was already instaled on my laptop, so I have started with 1.5: VM clone creation
![photo_2019-12-05_22-08-26](https://user-images.githubusercontent.com/58468159/70269824-ce86ab00-17ab-11ea-893e-e5acd6cd367c.jpg)

### Than I have created group, learned and tried group functions:
### Start, Pause, Reset, Close (save state, send shutdown signal, poweroff)
![photo_2019-12-05_22-10-08](https://user-images.githubusercontent.com/58468159/70269928-055cc100-17ac-11ea-8fca-e39f2bd2f62b.jpg)

### After that I have made several snapshots of VM, after some changes inside it
![photo_2019-12-05_22-12-51](https://user-images.githubusercontent.com/58468159/70270142-67b5c180-17ac-11ea-9ee0-192065ae0d9b.jpg)

### Than I have made export of VM1, than I have recieve image of other VM and import it to my Virtual Box

![photo_2019-12-05_22-15-02](https://user-images.githubusercontent.com/58468159/70270281-bb280f80-17ac-11ea-8b76-95394df548d5.jpg)
![photo_2019-12-05_22-15-10](https://user-images.githubusercontent.com/58468159/70270289-bebb9680-17ac-11ea-99eb-1fcb997f62ba.jpg)

### After that I have started VM configuration
### First of all I have set up USB ports

![photo_2019-12-05_22-17-12](https://user-images.githubusercontent.com/58468159/70270414-080be600-17ad-11ea-93ae-7c7d3bcc8555.jpg)

### Than, I have created and set up shared folder between VM and host
![photo_2019-12-05_22-18-48](https://user-images.githubusercontent.com/58468159/70270492-3c7fa200-17ad-11ea-8161-f0cc2fdd104d.jpg)


### Next stage is network configurations 
![image](https://user-images.githubusercontent.com/58468159/70270547-5620e980-17ad-11ea-953d-b2f2411e3cca.png)


### As a result I can say, that Network Bridge is the best option, cause this setting will allow:	
	
* emulate a network of several computers on one computer	
* access to the web server, FTP, SSH and other network services of the virtual computer from a physical computer (for example, I can configure a web server for users of a local or global network on a virtual computer)
* access the web server, FTP, SSH and other network services of the physical computer from the virtual one (for example, Kali Linux with vulnerability scanners can be installed in the virtual machine, and the web server of the physical computer and other hosts can be scanned from the virtual machine local or global network)	
* virtual machines can directly connect to each other on the network via IP (for example, one virtual machine may have a vulnerability scanner, and the other a vulnerable environment (OS, applications, websites, etc.)	

### Next stage is working with Virtual Box using command line interface and VBoxManage
### I have tested some of the basic commands: list, showvminfo, createvm, startvm, modifyvm, clonevm, snapshot, controlvm
### You can see results of commands execution on screenshots below

![photo_2019-12-05_22-27-07](https://user-images.githubusercontent.com/58468159/70271124-77360a00-17ae-11ea-92d5-2d0b39e23c23.jpg)
![photo_2019-12-05_22-27-03](https://user-images.githubusercontent.com/58468159/70271123-769d7380-17ae-11ea-87ee-2834e0ca6367.jpg)
![photo_2019-12-05_22-27-12](https://user-images.githubusercontent.com/58468159/70271125-77360a00-17ae-11ea-8f61-afcd7fe20d61.jpg)
![photo_2019-12-05_22-27-19](https://user-images.githubusercontent.com/58468159/70271114-7604dd00-17ae-11ea-9aed-c8c5f8e09add.jpg)
![photo_2019-12-05_22-27-22](https://user-images.githubusercontent.com/58468159/70271116-769d7380-17ae-11ea-9a40-d6fcad843d73.jpg)
![photo_2019-12-05_22-27-27](https://user-images.githubusercontent.com/58468159/70271119-769d7380-17ae-11ea-8795-661bb54788aa.jpg)
![photo_2019-12-05_22-27-30](https://user-images.githubusercontent.com/58468159/70271120-769d7380-17ae-11ea-8725-d6d2c3aa553d.jpg)
![photo_2019-12-05_22-27-34](https://user-images.githubusercontent.com/58468159/70271122-769d7380-17ae-11ea-9f0b-445157957c55.jpg)



## Task 2.2. Part 2. Vagrant

### First of all I have installed Vargrant, created dirrectory zhuvakajulia and init hashicorp/precise64 as a default
![photo_2019-12-04_12-56-01](https://user-images.githubusercontent.com/58468159/70391096-1723ab80-19da-11ea-821c-c2f87271ffd5.jpg)
![photo_2019-12-08_16-44-31](https://user-images.githubusercontent.com/58468159/70391099-1db22300-19da-11ea-8445-a9ec4b2a7eed.jpg)

### After that I have executed vagrant up command
![photo_2019-12-08_16-47-32](https://user-images.githubusercontent.com/58468159/70391127-7681bb80-19da-11ea-8c5e-0b68d2053107.jpg)

### Than I have connected to VM using putty (login – vagrant, password - vagrant) and executed date command
![photo_2019-12-08_16-48-54](https://user-images.githubusercontent.com/58468159/70391144-a335d300-19da-11ea-9826-831f134bdf2a.jpg)

### Next step was to halt and destroy current VM
![photo_2019-12-08_16-50-40](https://user-images.githubusercontent.com/58468159/70391171-e1cb8d80-19da-11ea-9399-5b6dbd2bc8f5.jpg)

### More challenging task was to create Multiple VMs using Vagrantfile
![photo_2019-12-08_16-52-26](https://user-images.githubusercontent.com/58468159/70391205-2bb47380-19db-11ea-9d79-19f466e70f8a.jpg)
![photo_2019-12-08_16-52-32](https://user-images.githubusercontent.com/58468159/70391206-2bb47380-19db-11ea-9688-d6b8cdaaa38c.jpg)

### And the last step - choose and install Vagrant box. I have chosen Official_Ubuntu_11.10_Server_amd64 from http://www.vagrantbox.es/

![photo_2019-12-08_16-53-43](https://user-images.githubusercontent.com/58468159/70391218-4f77b980-19db-11ea-9680-63ba43618038.jpg)


