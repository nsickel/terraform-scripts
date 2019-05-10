# output website endpoint of bucket
output "bucket_endpoint" {
  value = "${aws_s3_bucket.website_bucket.website_endpoint}"
}
