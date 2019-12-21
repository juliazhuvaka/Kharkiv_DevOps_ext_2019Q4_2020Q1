
## Wireshak

#### First of all I had to turn off firewalls on both PC to allow ICMP exchange between computers
#### Next step - check weather everything works correct or not. Exchange works correct

#### Lets start packet capture

#### First step - turn on wireshark and start trafic capturing
#### And we can see lot of different protocol packets

![photo_2019-12-21_19-34-01](https://user-images.githubusercontent.com/58468159/71311839-7c40bd80-242c-11ea-9109-a4fb72efb6f3.jpg)

#### Lets set some filters
#### I have applied filtration by: IP, MAC adress of my PC and type of packet, that uses ping command (ICMP packet) 

![photo_2019-12-21_19-43-57](https://user-images.githubusercontent.com/58468159/71311860-af834c80-242c-11ea-8556-f153e7aef273.jpg)
![photo_2019-12-21_19-34-38](https://user-images.githubusercontent.com/58468159/71311861-af834c80-242c-11ea-9baf-0ecefb5b8873.jpg)
![photo_2019-12-21_19-43-01](https://user-images.githubusercontent.com/58468159/71311862-b01be300-242c-11ea-87fb-6c2fa0404566.jpg)


#### And the last, I should build the IP header for the packet

![photo_2019-12-21_19-47-40](https://user-images.githubusercontent.com/58468159/71311884-10ab2000-242d-11ea-8a81-858e7afd3fe2.jpg)
