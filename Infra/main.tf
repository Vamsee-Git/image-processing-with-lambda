module "s3" {
  source = "./modules/s3"
  bucket_name = var.image_bucket_name
}

module "resized_s3" {
  source = "./modules/s3"
  bucket_name = var.resized_image_bucket_name
}

module "sns" {
  source = "./modules/sns"
  topic_name = var.notification_topic_name
  notification_email = var.notification_email
}

module "lambda" {
  source = "./modules/lambda"
  bucket_name = var.image_bucket_name
  resized_bucket_name = var.resized_image_bucket_name
  topic_arn = module.sns.topic_arn
  lambda_package_bucket = var.lambda_package_bucket
  lambda_package_key = var.lambda_package_key
}
