resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = file("lambda-policy.json")
}

data "archive_file" "lambda_function" {
  type        = "zip"
  source_file = "../lambda-function/lambda_function.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "my_lambda_function" {
  filename      = data.archive_file.lambda_function.output_path
  function_name = "power-of-math"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
