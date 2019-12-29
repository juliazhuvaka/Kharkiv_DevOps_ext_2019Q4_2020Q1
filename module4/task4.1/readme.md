### Task 4.1. PowerShell. Beginning

1. First of all lets check all commandlets and select only their name for output

![photo_2019-12-29_17-34-09](https://user-images.githubusercontent.com/58468159/71560829-3bbdf100-2a77-11ea-8a10-13c124e0f288.jpg)


2. Next step is to create  folders, files inside it, subfolders and again files and add some information inside each file.txt in this structure. Sounds complicated, but lets see what I have done. pic 1 and 2 - structure creation, pic.3 - have added some information

![photo_2019-12-29_18-08-15](https://user-images.githubusercontent.com/58468159/71560908-47f67e00-2a78-11ea-8fa1-e804b2de3168.jpg)
![photo_2019-12-29_18-08-52](https://user-images.githubusercontent.com/58468159/71560909-47f67e00-2a78-11ea-8fdc-da2c196cd190.jpg)
![photo_2019-12-29_18-09-11](https://user-images.githubusercontent.com/58468159/71560911-47f67e00-2a78-11ea-8445-9a8fff495c40.jpg)


3. After that I have to read content inside of the file, with path: C:\Users\julie\rootfolder\folder1\sub1\file.txt
I have done it, using "cat" command

![photo_2019-12-29_18-10-35](https://user-images.githubusercontent.com/58468159/71561006-5abd8280-2a79-11ea-85cd-c87ed30e960b.jpg)

4. Next step - check root directory content structure. In our case root directory would be .\rootfolder
Lets use commandlet "get-childitem" with key "-recurse" to include all subfolders and files

![photo_2019-12-29_18-13-43](https://user-images.githubusercontent.com/58468159/71561012-76c12400-2a79-11ea-88d5-fd0ba7140ec8.jpg)

5. If I need to find files with exact extension, I will use additional key: "-include" and say that I need all files "*" with extension ".xml" 

Lets see what we have


![photo_2019-12-29_20-38-44](https://user-images.githubusercontent.com/58468159/71561136-3e224a00-2a7b-11ea-852c-4c888ba726de.jpg)


6. Now lets delete sub2 directory with all files inside it
![photo_2019-12-29_18-23-20](https://user-images.githubusercontent.com/58468159/71561181-cef92580-2a7b-11ea-8303-1f161e22da4a.jpg)


7. I have managed tasks, connected with file system, lets start block, connected with processes and services
First of all I have to check all services, that are installed on my laptop and sort them on running and stopped.
I have done it using "Get-Service | Sort-Object Status -Descending" I have used key to -descending to see running services on the top of the list

![photo_2019-12-29_18-33-40](https://user-images.githubusercontent.com/58468159/71561232-87bf6480-2a7c-11ea-99fd-10eb2c7177f7.jpg)

8. Last task is to check information about "system" process and do it in different formats
First I have just outputed information about process and than outputed them in different formats

![photo_2019-12-29_18-36-40](https://user-images.githubusercontent.com/58468159/71561274-02887f80-2a7d-11ea-8150-5b7cec779e25.jpg)
![photo_2019-12-29_19-25-21](https://user-images.githubusercontent.com/58468159/71561275-04524300-2a7d-11ea-97e9-cdfa2fc3eccb.jpg)

