Task 2.4

Deploy Docker Containers on Amazon Elastic Container Service (Amazon ECS)

First step was to set up first run with Amazon ECS using default settings and app
![photo_2019-12-12_16-15-58](https://user-images.githubusercontent.com/58468159/70720909-6715b180-1cfd-11ea-9be9-05ad44941ac9.jpg)

Next I had to open sample application in browser 

![photo_2019-12-12_16-23-55](https://user-images.githubusercontent.com/58468159/70721241-e60aea00-1cfd-11ea-80c6-7993aeb5fc8b.jpg)

And the last - I had to delete all an Amazon ECS cluster, an Amazon EC2 instance, and a load balancer to avoid charges 
To ensure that I don't accidentally delete a service with active tasks, I have stoped all tasks before Amazon ECS will delete a service.

![photo_2019-12-12_16-26-16](https://user-images.githubusercontent.com/58468159/70722064-49494c00-1cff-11ea-939c-49cba4ca86c8.jpg)

And than deleted all created services from this task
