
Task 6.5

1. First of all lets create test user, set all basic stuff and allow him ssh connection and su

![1 1script](https://user-images.githubusercontent.com/58468159/74093233-c9114e00-4ad7-11ea-946c-00379ca87354.jpg)
![1 root](https://user-images.githubusercontent.com/58468159/74093236-c9114e00-4ad7-11ea-9b90-98631c7c0727.jpg)
![1 1ssh](https://user-images.githubusercontent.com/58468159/74093234-c9114e00-4ad7-11ea-88d5-2307a25b112b.jpg)
![1 1ssh2](https://user-images.githubusercontent.com/58468159/74093235-c9114e00-4ad7-11ea-9c79-449254ed6df1.jpg)
![1 1files](https://user-images.githubusercontent.com/58468159/74093232-c878b780-4ad7-11ea-822f-f353a4c48bef.jpg)



2. Lets open new terminal, log as test user and check who are loged in the system and in which terminals
![2](https://user-images.githubusercontent.com/58468159/74093237-c9a9e480-4ad7-11ea-873e-b885067c43a8.jpg)

3. using crontab -e lets create small task, which will send message to all users on all terminals
"* * * * * wall ..."
![3](https://user-images.githubusercontent.com/58468159/74093220-c7478a80-4ad7-11ea-96a3-8e7df79055ed.jpg)
4. Checking network settings
![4](https://user-images.githubusercontent.com/58468159/74093221-c7478a80-4ad7-11ea-834f-900a11c71863.jpg)
![4 ping](https://user-images.githubusercontent.com/58468159/74093222-c7e02100-4ad7-11ea-98f1-77b85d0eef33.jpg)
![4 tcpdump](https://user-images.githubusercontent.com/58468159/74093223-c7e02100-4ad7-11ea-829d-812d2421a60b.jpg)

5. Checking file system parameters
![5 etc mtab](https://user-images.githubusercontent.com/58468159/74093226-c7e02100-4ad7-11ea-8b95-c9dc6f653187.jpg)
![5](https://user-images.githubusercontent.com/58468159/74093227-c7e02100-4ad7-11ea-8cba-d8bf70730577.jpg)
![5 2](https://user-images.githubusercontent.com/58468159/74093224-c7e02100-4ad7-11ea-989b-b331a39e1cff.jpg)

6. Script, which automaticly check changes in the /etc/passwd, shadow and group and makes its backup if they have changed
+ Added task for cron to run this script every day 
![6 script](https://user-images.githubusercontent.com/58468159/74093229-c878b780-4ad7-11ea-818b-85079e9c08be.jpg)
![6 1](https://user-images.githubusercontent.com/58468159/74093228-c878b780-4ad7-11ea-9cfe-2560dc8ea795.jpg)

7. Script, that creates number of users, that user says and take names for user from the file
![7 script](https://user-images.githubusercontent.com/58468159/74093231-c878b780-4ad7-11ea-9203-d2cbc9d0eee2.jpg)
![7](https://user-images.githubusercontent.com/58468159/74093230-c878b780-4ad7-11ea-972e-f07cc3e8aa31.jpg)



