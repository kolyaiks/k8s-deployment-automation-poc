resource "aws_cloudwatch_log_metric_filter" "application_error" {
  name           = "application_error"
  pattern        = var.error_patter_to_look_for
  log_group_name = "/aws/containerinsights/${module.eks.cluster_name}/application" ## gonna be created once amazon-cloudwatch-observability addon is installed

  metric_transformation {
    name      = "application_error_count"
    namespace = "/aws/containerinsights/${module.eks.cluster_name}/application"
    value     = "1"
  }

  depends_on = [module.eks]
}

resource "aws_cloudwatch_metric_alarm" "error_threshold_breached" {
  alarm_name                = "eks_application_error_threshold_breached"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 1
  metric_name               = aws_cloudwatch_log_metric_filter.application_error.metric_transformation[0].name
  namespace                 = aws_cloudwatch_log_metric_filter.application_error.metric_transformation[0].namespace
  period                    = 60
  statistic                 = "Maximum"
  threshold                 = 0
  alarm_description         = "This metric shows number of errors logged in the application in EKS"
  insufficient_data_actions = []
  alarm_actions             = [aws_sns_topic.alarms.arn]
  ok_actions                = [aws_sns_topic.alarms.arn]
}

resource "aws_sns_topic" "alarms" {
  name = "alarms-sns-topic"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.alarms.arn
  protocol  = "email"
  endpoint  = var.notifications_email
}
