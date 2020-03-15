## Навигация

* [Описание проекта](#Описание-проекта)
* [Шаг 1. Создание Telegram бота](#Шаг-1)
* [Шаг 2. Создание Lambda Function](#Шаг-2)
* [Шаг 3. Создание API Gateway](#Шаг-3)
* [Шаг 4. Создание Webhook](#Шаг-4)
* [Шаг 5. Создание кода на Python](#Шаг-5)
* [Terraform. API Gateway](#API-Gateway)
* [Terraform. Lambda Function](#Lambda-Function)
* [Terraform. S3 Bucket](#S3-Bucket)

## Описание проекта

Для работы бота в телеграмме необходимы вычислительные мощности, которые телеграм не предоставляет. Но телеграм позволяет отправлять строку и возвращать ее обратно. Этим и воспользуемся
С другой стороны, лямбда - это сервер или контейнер, который создается на небольшой промежуток времени и исчезает. Лямбда отлично подходит для редкого использования в отличие от сервера, который работает постоянно. Что делает ее идеальным инструментом для реализации проекта.

Пошаговая реализация
### Шаг 1
Самый простой - создать телеграм бот и получить секретный ключ - token. Для этого необходимо найти @BotFather в Telegram и создать нового бота

### Шаг 2
Создаем пустую лямбда - функцию. Для своего проекта я выбрала язык программирования питон т.к он входит в топ 3 - по популярности языков программирования после java и C, но пока просто создадим функцию для последующей работы с ней. Кроме языка программирования также необходимо создать или добавить роль, в которой прописаны разрешения для лямды использовать те или иные сервисы aws. Нам необходим полный доступ к полли и с3

### Шаг 3
При создании выбираем Rest API и указываем имя, API успешно создан. Теперь для него нужны методы т.е то как мы будем взаимодействовать с API Gateway. Action - create method - any, переходим в метод и указываем с чем интегрировать наш апи, т.е куда передавать полученную информацию. В нашем случае - указываем на какую лямбда функцию передавать всю информацию и деплоим апи. Теперь он готов к использованию и дал нам ссылку, перейдя по которой апи принимает запрос, передает его лямбде и эта самая функция отрабатывает
Если сейчас перейти по ссылке - мы увидим как отработал sample-code Hello from lambda. 

### Шаг 4
Отлично, апи связан с лямбдой, теперь нам необходимо чтобы апи получал данные, которые мы передаем в телеграм бота. Здесь нам необходимо использовать Webhook
Webhook — механизм оповещения системы о событиях. Нам не нужно постоянно запрашивать новые данные, потому, что когда происходит событие он сам отслеживает и передаёт в теле POST запроса JSON свежие данные
Web hook выглядит следующим образом:
https://api.telegram.org/bot{TOKEN}/setWebHook?url={ССЫЛКА, КОТОРУЮ ПОЛУЧИЛИ ОТ API - GATEWAY ПОСЛЕ ДЕПЛОЯ}


Заменяем данные на наши, переходим по ссылке и видим следующий ответ:


### Шаг 5
Для начала разберемся с модулями, которые мы имопртируем:

```python
import boto3
import os
import json
import requests
from contextlib import closing
```

* boto3.client

Позволяет взаимодействовать с сервисами AWS
* os.path.join

Метод join позволяет вам совместить несколько путей при помощи присвоенного разделителя. По сути  мы совместили путь каталога и файла вместе, для получения рабочего пути
* json 

Необходим т.к мы получаем данные через API и он необходим для последующей работы с ними
* requests.get

Библиотека requests является стандартным инструментом для составления HTTP-запросов в Python. Метод GET указывает на то, что происходит попытка извлечь данные из определенного ресурса
* from contextlib import closing

Позволяет автоматически «закрыть» объект после отрабатывания кода.

С модулями разобрались, переходим к коду

В переменные добавляем токен нашего бота, а также заготовку для телеграм. мы уже видели подобную ссылку раньше, когда создавали вебхук, аналогичные ссылки есть для любого действия, в нашем случае - мы будем отправлять сообщения и voice-messages. Также есть переменная s3, которую мы будем использовать для работы с ним
```python
TELE_TOKEN=os.environ['BOT_ID']
URL = "https://api.telegram.org/bot{}/".format(TELE_TOKEN)

s3 = boto3.client('s3')
```
И первая функция: generate voice. что мы видим
В функцию мы передаем 2 значения: текст для синтезирования в речь и имя файла, которое будет в итоге присвоено. Далее мы вызываем клент полли и говорим ему: полли, синтезируй речь с войс айди максим, в формате ogg с текстом текст и помещаем результат в переменную response для последующего использования

```python
def generate_voice(text, filename):
    polly_client = boto3.client('polly')
    response = polly_client.synthesize_speech(VoiceId=os.environ['VOICE_NAME'],
                    OutputFormat='ogg_vorbis', 
                    Text = text)
```

Далее нам нужно куда-то временно записать результате синтеза речи, чтобы потом отправить на с3. Лямбда представляет собой сервер или контейнер, но в любом случае это некая вычислительная мощность, виртуальная машина у которой есть своя файловая система. Этим и воспользуемся. Записываем наш объект в файловую систему лямбды в папку tmp с таким то именем файла
Следующим шагом мы загружаем этот файл из тмп в с3 бакет с таким то названием и таким именем файла. Первая функция готова

```python   
    with closing(response["AudioStream"]) as stream:
                output = os.path.join("/tmp/", filename)
                with open(output, "wb") as file:
                    file.write(stream.read())


    s3.upload_file('/tmp/' + filename, 
      os.environ['S3_BUCKET_NAME'], 
      filename)
```
Теперь нам осталось отправить данный файл из с3 бакета обратно телеграму. используем метод сенд войс. Мы даем ему юрл из самого начала с нашим токеном, указываем что делаем (сендвойс), говорим где он лежит (линк) и чат айди, кому именно мы его отправляем используя модуль requests мы собственно и передаем это все телеграму
Сразу после доставки удаляем наш объект из бакета, чтобы не занимал место

```python
def send_audio(chat_id, link, filename):
    url = URL + "sendVoice?voice={}&chat_id={}".format(link, chat_id)
    requests.get(url)
    
    s3.delete_object( 
        Bucket=os.environ['S3_BUCKET_NAME'],
        Key=filename
        )
```        

Следующая функция аналогична предыдущей, но это велком месседж, который вы все получили, нажав на кнопку start
        
```python
def send_message(chat_id):
    final_text = os.environ['START_MESSAGE']
    url = URL + "sendMessage?text={}&chat_id={}".format(final_text, chat_id)
    requests.get(url)
```

И самое главное, лямбда не должна думать что ей делать, в каком порядке и в каком  случае что ей отправлять и для этого есть фукция handler или обработчик.  
Первым делом нам необходимо обработать всю информацию, которую получили от API в формате JSON, вызываем модуль с считываем данные из блока message, в нем много информации, но нам необходимы чат айди и текст. Здесь же задаем файлнэйм и указываем, что имя нашего файла должно быть разделено подчеркиваниями и включать в себя только первых 3 слова + указываем желаемое расширение для файла. Далее аудио линк - это ссылка на бакет, из которого аудиофайлы будут отправляться в телеграм и какое у них имя. Теперь мы видим условие. если команда = старт - вызываем функцию send message если что угодно другое - вызываем функции generate voice и send аудио для синтеза и отправки аудио в телеграмм
```python
def lambda_handler(event, context):
        message = json.loads(event['body'])['message']
        chat_id = message['chat']['id']
        reply = message['text']
        command = reply.split()[0][1:]
        filename = '_'.join(reply.split()[:3]) + ".ogg"
        audio_link = "https://{}.s3.{}.amazonaws.com/{}".format(os.environ['S3_BUCKET_NAME'], os.environ['REGION'], filename)
        if command=="start": 
            send_message(chat_id)
        else:
            generate_voice(reply, filename)
            send_audio(chat_id, audio_link, filename)
        return {
            'statusCode': 200
        }
```

Как вы могли заметить, в коде отсутствуют уникальные данные пользователя, все они помещены в environment variables для простого использования любым пользователем


Следующий шаг - поднятие инфраструктуры, описанной мной, в одно нажатие кнопки или terraform

Для реализации нам потребуется создать 3 .tf файла со следующим содержимым:
### API Gateway

Файл, в котором описано создание нового API, присваивается метод, связь с Lambda-функцией, деплой, настройка веб-хука

```terraform 
provider "aws" {
   region = "us-east-2"
 }

resource "aws_api_gateway_rest_api" "terraform_api" {
  name        = "terraform_api_tg_bot"
  description = "Terraform Serverless Application"
}

 resource "aws_api_gateway_resource" "proxy" {
   rest_api_id = aws_api_gateway_rest_api.terraform_api.id
   parent_id   = aws_api_gateway_rest_api.terraform_api.root_resource_id
   path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy" {
   rest_api_id   = aws_api_gateway_rest_api.terraform_api.id
   resource_id   = aws_api_gateway_resource.proxy.id
   http_method   = "ANY"
   authorization = "NONE"
 }

 resource "aws_api_gateway_integration" "lambda" {
   rest_api_id = aws_api_gateway_rest_api.terraform_api.id
   resource_id = aws_api_gateway_method.proxy.resource_id
   http_method = aws_api_gateway_method.proxy.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.terraform_lambda.invoke_arn
 }

  resource "aws_api_gateway_method" "proxy_root" {
   rest_api_id   = aws_api_gateway_rest_api.terraform_api.id
   resource_id   = aws_api_gateway_rest_api.terraform_api.root_resource_id
   http_method   = "ANY"
   authorization = "NONE"
 }

 resource "aws_api_gateway_integration" "lambda_root" {
   rest_api_id = aws_api_gateway_rest_api.terraform_api.id
   resource_id = aws_api_gateway_method.proxy_root.resource_id
   http_method = aws_api_gateway_method.proxy_root.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = aws_lambda_function.terraform_lambda.invoke_arn
 }

 
 resource "aws_api_gateway_deployment" "terraform_api" {
   depends_on = [
     aws_api_gateway_integration.lambda,
     aws_api_gateway_integration.lambda_root,
   ]

   rest_api_id = aws_api_gateway_rest_api.terraform_api.id
   stage_name  = "test"
 }


data "http" "webhook" {
  url = "https://api.telegram.org/bot${var.bot_token}/setWebHook?url=${aws_api_gateway_deployment.terraform_api.invoke_url}"
}
```

### Lambda Function

В данном документе создаем роль и policy для взаимодействия функции с другими сервисами AWS, указываем где лежит код для лямбды, создаем саму функцию, добавляем Environment variables и добавляем триггер на срабатывание - API Gateway

```terraform
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_policy" "policy" {
  name        = "policy"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.iam_for_lambda.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}


resource "aws_lambda_function" "terraform_lambda" {
  s3_bucket = "bucketwithcode"
  s3_key    = "lambda.zip"
  function_name = "terraform_lambda_tg_bot"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler = "lambda_function.lambda_handler"
  runtime = "python3.8"

}

  environment {
    variables = {
      BOT_ID = ""
	  VOICE_NAME = "Maxim"
	  S3_BUCKET_NAME = "bucketname"
	  START_MESSAGE = "Привет! умею озвучивать текст, который ты мне пишешь:) Попробуй мне что-то написать"
	  REGION = "us-east-2"
    }
  }

resource "aws_lambda_permission" "apigw" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.terraform_lambda.function_name
   principal     = "apigateway.amazonaws.com"


   source_arn = "${aws_api_gateway_rest_api.terraform_api.execution_arn}/*/*"
 }
```

### S3 Bucket

Создаем корзину в S3 для загрузки аудио файлов, а также добавляем policy, которая сделает все объекты в корзине публичными

```terraform
resource "aws_s3_bucket" "zhuvakayuliiatg" {
  bucket = "zhuvakatelegram"
}

resource "aws_s3_bucket_policy" "zhuvakayuliiatg" {
  bucket = "${aws_s3_bucket.zhuvakayuliiatg.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::zhuvakatelegram/*",
      "Principal": "*"
    }
  ]
}
POLICY
}
```
