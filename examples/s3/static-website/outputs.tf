output "website_endpoint" {
  value = "${module.s3-static-website.bucket_endpoint}"
}