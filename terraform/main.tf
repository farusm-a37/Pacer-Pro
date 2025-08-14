provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "app-server"
  }
}

resource "aws_sns_topic" "alerts" {
  name = "high-response-alerts"
}

resource "aws_lambda_function" "restart_instance" {
  function_name = "restart_instance"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "lambda_handler.lambda_handler"
  runtime       = "python3.11"

  filename         = "../lambda_function/lambda_function.zip"
  source_code_hash = filebase64sha256("../lambda_function/lambda_function.zip")

  environment {
    variables = {
      INSTANCE_ID   = aws_instance.app_server.id
      SNS_TOPIC_ARN = aws_sns_topic.alerts.arn
    }
  }
}
