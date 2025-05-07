module "s3" {
  source = "./modules/s3"
  bucket_name = var.image_bucket_name
}

module "sns" {
  source = "./modules/sns"
  topic_name = var.notification_topic_name
}

module "lambda" {
  source = "./modules/lambda"
  bucket_name = var.image_bucket_name
  topic_arn = module.sns.topic_arn
}
