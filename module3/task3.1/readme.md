## Task 3.1

### Part 1
According to a task I have to simulate the local network of the organization, which contains 1 house with four floors. The horizontal subsystem of the floor consists of two working groups of 3 and 5 computers, respectively.
Structure the network into 8 subnets and deny traffic between the first and third floors.


First of all, I have to create all the system and configure it.
Create all the elements of the system and than configure them:
Set IP adresses to each PC, configure router, set IP for each port, according to gateway

As a result I have recieved working system. 
Below you can find video with a result


[![Watch the video](https://user-images.githubusercontent.com/58468159/70851998-e396c480-1ea4-11ea-9c95-c045c7e1c95a.jpg)](https://youtu.be/oaZGB6XUNE0)



Next and last step was to deny traffic beetween the first and third floors, I have done it using extendet access-lіst command on router

Below there is a video with the result


[![Watch the video](https://user-images.githubusercontent.com/58468159/70851998-e396c480-1ea4-11ea-9c95-c045c7e1c95a.jpg)](https://youtu.be/gxxKpWPAqZA)


### Part 2
It is necessary to simulate the local network of a complex of 5 one-story buildings, consisting of 5 working groups of 6 computers. The network is based on a single port router. Deny traffic between building 1 and 5.
I have created group not 5, but 3 buildings with 2 computers in each (to start with simple)

After basic configuration of IP and gateways, I have created VLAN groups for each computer and configured FastEthernet ports (for each computer as well)

![photo_2019-12-15_13-51-24](https://user-images.githubusercontent.com/58468159/70867286-840be800-1f7c-11ea-82bd-c385e6091f2d.jpg)


Than I have enabled trunk port, using CLI

![photo_2019-12-15_14-06-53](https://user-images.githubusercontent.com/58468159/70867321-dd741700-1f7c-11ea-8c6b-279e1cd7a9d2.jpg)

And the last step of configuration was central switch ports connection

![photo_2019-12-15_14-09-48](https://user-images.githubusercontent.com/58468159/70867335-0bf1f200-1f7d-11ea-88ec-8274884a34dd.jpg)

On video below you can see working network (all-to-all traffic)

[![Watch the video](https://i9.ytimg.com/vi/hXEyvf8jAX8/mq2.jpg?sqp=CJSD2u8F&rs=AOn4CLCENBfO13_so9KP5YAWZ90MxuuunA)](https://youtu.be/RltzGA-_9bU)

Next and last step was to deny traffic beetween the first and third houses, I have done it using extendet access-lіst command on router


[![Watch the video](https://i9.ytimg.com/vi/hXEyvf8jAX8/mq2.jpg?sqp=CJSD2u8F&rs=AOn4CLCENBfO13_so9KP5YAWZ90MxuuunA)](https://youtu.be/hXEyvf8jAX8)

