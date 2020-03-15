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
	  S3_BUCKET_NAME = "bucketforaudio"
	  START_MESSAGE = "Привет! умею озвучивать текст, который ты мне пишешь:) Попробуй мне что-то написать"
	  REGION = "regionbucket"
    }
  }

resource "aws_lambda_permission" "apigw" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.terraform_lambda.function_name
   principal     = "apigateway.amazonaws.com"


   source_arn = "${aws_api_gateway_rest_api.terraform_api.execution_arn}/*/*"
 }