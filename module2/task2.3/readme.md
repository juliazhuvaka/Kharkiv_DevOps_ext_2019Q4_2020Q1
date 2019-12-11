EC2
First of all I have Launched a Linux Virtual Machine and connected to it using command line. After that I have terminated virtual machine
![photo_2019-12-10_22-50-30](https://user-images.githubusercontent.com/58468159/70636709-ab8e4800-1c3e-11ea-936b-3edf68f9c340.jpg)

S3

Using S3 I have created Bucket, uploaded some files into it, downloaded them on my laptop and than deleted

![photo_2019-12-11_17-51-40](https://user-images.githubusercontent.com/58468159/70636945-1049a280-1c3f-11ea-876d-a40bb1177cec.jpg)

WordPress website using EC2
First of all I have created new VM, on AWS Marketplace has found WordPress powered by BitNami and launched it

![photo_2019-12-11_15-24-09](https://user-images.githubusercontent.com/58468159/70637237-91a13500-1c3f-11ea-9b73-db9214c9abc6.jpg)

After all configuration I have recieved accsess to my website and started CV creation
Here you can see part of my website pages

![photo_2019-12-11_15-23-57](https://user-images.githubusercontent.com/58468159/70637289-a67dc880-1c3f-11ea-997d-0901765a1d21.jpg)

[Link to my CV page, created using WordPress](http://3.136.59.135/)

Route 53
I have learned all the information from the instruction page and in future can manage registration of website domain

AWS IAM and AWS CLI
I have created new user with administrator rights and saved credentials.csv to my computer
After that, using aws configure I have connected to AWS 

![photo_2019-12-11_17-04-22](https://user-images.githubusercontent.com/58468159/70638014-d6799b80-1c40-11ea-8a20-7d444a067211.jpg)

next step was to create new bucket in S3 and download some files into it

![photo_2019-12-11_17-04-33](https://user-images.githubusercontent.com/58468159/70638116-f9a44b00-1c40-11ea-94b8-41021ee5f106.jpg)
![photo_2019-12-11_17-04-45](https://user-images.githubusercontent.com/58468159/70638121-fe68ff00-1c40-11ea-9822-baa791198178.jpg)

After that I have checked wheather everything was uploaded or not, and everything was OK

![photo_2019-12-11_17-04-57](https://user-images.githubusercontent.com/58468159/70638223-29535300-1c41-11ea-942e-b08193bfeebe.jpg)

Static, public website using S3
And the last step was to create website inside S3
I have changed properties of the bucket to static website hosting

![photo_2019-12-11_18-09-22](https://user-images.githubusercontent.com/58468159/70638420-86e79f80-1c41-11ea-82dc-aa80ac6a8d25.jpg)

Added index.html and error.html files to the bucket

![photo_2019-12-11_18-09-26](https://user-images.githubusercontent.com/58468159/70638485-a1217d80-1c41-11ea-85be-cbfe5d5fe030.jpg)

Setted public access for them
And as a result, website was created

![photo_2019-12-11_18-09-30](https://user-images.githubusercontent.com/58468159/70638497-a7175e80-1c41-11ea-8952-3c47664c83a4.jpg)

[You can find it here](http://zhuvakabucket.s3-website-us-east-1.amazonaws.com/)
