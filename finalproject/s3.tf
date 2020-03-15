resource "aws_s3_bucket" "zhuvakayuliiatg" {
  bucket = "bucketforaudio"
}

resource "aws_s3_bucket_policy" "zhuvakayuliiatg" {
  bucket = "${aws_s3_bucket.zhuvakayuliiatg.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::bucketforaudio/*",
      "Principal": "*"
    }
  ]
}
POLICY
}


