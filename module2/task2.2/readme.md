## Task 2.2. Part 1. Virtual Box

Oracle VM Virtual Box was already instaled on my laptop, so I have started with 1.5: VM clone creation
![photo_2019-12-05_22-08-26](https://user-images.githubusercontent.com/58468159/70269824-ce86ab00-17ab-11ea-893e-e5acd6cd367c.jpg)

Than I have created group, learned and tried group functions:
Start, Pause, Reset, Close (save state, send shutdown signal, poweroff)
![photo_2019-12-05_22-10-08](https://user-images.githubusercontent.com/58468159/70269928-055cc100-17ac-11ea-8fca-e39f2bd2f62b.jpg)

After that I have made several snapshots of VM, after some changes inside it
![photo_2019-12-05_22-12-51](https://user-images.githubusercontent.com/58468159/70270142-67b5c180-17ac-11ea-9ee0-192065ae0d9b.jpg)

Than I have made export of VM1, than I have recieve image of other VM and import it to my Virtual Box

![photo_2019-12-05_22-15-02](https://user-images.githubusercontent.com/58468159/70270281-bb280f80-17ac-11ea-8b76-95394df548d5.jpg)
![photo_2019-12-05_22-15-10](https://user-images.githubusercontent.com/58468159/70270289-bebb9680-17ac-11ea-99eb-1fcb997f62ba.jpg)

After that I have started VM configuration
First of all I have set up USB ports

![photo_2019-12-05_22-17-12](https://user-images.githubusercontent.com/58468159/70270414-080be600-17ad-11ea-93ae-7c7d3bcc8555.jpg)

Than, I have created and set up shared folder between VM and host
![photo_2019-12-05_22-18-48](https://user-images.githubusercontent.com/58468159/70270492-3c7fa200-17ad-11ea-8161-f0cc2fdd104d.jpg)


Next stage is network configurations 
![image](https://user-images.githubusercontent.com/58468159/70270547-5620e980-17ad-11ea-953d-b2f2411e3cca.png)
As a result I can say, that Network Bridge is the best option, cause this setting will allow:	
	
* emulate a network of several computers on one computer	
* access to the web server, FTP, SSH and other network services of the virtual computer from a physical computer (for example, I can configure a web server for users of a local or global network on a virtual computer)
* access the web server, FTP, SSH and other network services of the physical computer from the virtual one (for example, Kali Linux with vulnerability scanners can be installed in the virtual machine, and the web server of the physical computer and other hosts can be scanned from the virtual machine local or global network)	
* virtual machines can directly connect to each other on the network via IP (for example, one virtual machine may have a vulnerability scanner, and the other a vulnerable environment (OS, applications, websites, etc.)	

Next stage is working with Virtual Box using command line interface and VBoxManage
