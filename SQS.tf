resource "aws_sqs_queue" "event_queue" {
  name = "eventbridge-queue"
}

resource "aws_cloudwatch_event_target" "sqs_target" {
  rule = aws_cloudwatch_event_rule.rule.name
  arn  = aws_sqs_queue.event_queue.arn
}

resource "aws_sqs_queue_policy" "allow_eventbridge" {
  queue_url = aws_sqs_queue.event_queue.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "events.amazonaws.com"
      },
      Action   = "sqs:SendMessage",
      Resource = aws_sqs_queue.event_queue.arn
    }]
  })
}