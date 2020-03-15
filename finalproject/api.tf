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

