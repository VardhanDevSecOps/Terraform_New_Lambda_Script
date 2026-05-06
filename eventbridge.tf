resource "aws_cloudwatch_event_rule" "rule" {
  name                = "eventbridge-sqs-rule"
  schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_rule" "lambda_schedule" {
  name                = "eventbridge-lambda-rule"
  schedule_expression = "rate(10 minutes)"
}