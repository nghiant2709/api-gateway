resource "aws_s3_bucket" "my_bucket" {
  bucket = local.bucket_name
}

resource "aws_s3_bucket_public_access_block" "my_bucket_website_acl" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "my_bucket_website_config" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "pubic_access" {
  bucket = aws_s3_bucket.my_bucket.id
  policy = file("bucket-policy.json")
}

