output "bucket_name" {
    value = aws_s3_bucket.s3bucket.bucket
  
}

output "region" {
  value = var.region
  
}

output "region_tag" {
  value = var.region_tags
}

output "name" {
  value = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
}