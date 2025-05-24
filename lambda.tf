resource "aws_lambda_function" "html" {
  filename         = "lambda_function.zip"
  function_name    = "html-page"
  handler          = "lambda_function.handler"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("lambda_function.zip")
  role             = aws_iam_role.lambda_exec.arn
}

resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.html.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}