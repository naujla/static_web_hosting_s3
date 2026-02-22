resource "aws_s3_bucket" "s3bucket" {
    bucket = "aws-s3-bucket-32123454323"
    tags = merge(
    var.region_tags,
    {
      name = "s3-bucket"
    }
  )
}

resource "aws_s3_bucket_public_access_block" "public-access" {
  bucket = aws_s3_bucket.s3bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}





resource "aws_s3_bucket_policy" "internet-access" {
  bucket = aws_s3_bucket.s3bucket.id
  policy = data.aws_iam_policy_document.allow_internet_access.json
}

data "aws_iam_policy_document" "allow_internet_access"{
  statement {
    sid       = "PublicReadGetObject"
    effect    = "Allow"
    resources = ["arn:aws:s3:::${aws_s3_bucket.s3bucket.id}/*"]
    actions   = ["s3:GetObject"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_website_configuration" "mywebapp"{
  bucket = aws_s3_bucket.s3bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index-file" {
  bucket = aws_s3_bucket.s3bucket.id
  source = "./index.html" #local file name
  key = "./index.html" #file name you want it to be uploaded in s3
  content_type = "text/html"
}

resource "aws_s3_object" "css-file" {
  bucket = aws_s3_bucket.s3bucket.id
  source = "./styles.css" #local file name
  key = "./styles.css" #file name you want it to be uploaded in s3
  content_type = "text/css"
}