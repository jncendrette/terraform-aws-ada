data "aws_caller_identity" "current" {

}

locals {
  policy = jsonencode(

    {
      "Version" : "2008-10-17",
      "Id" : "PolicyForCloudFrontPrivateContent",
      "Statement" : [
        {
          "Sid" : "AllowCloudFrontServicePrincipal",
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "cloudfront.amazonaws.com"
          },
          "Action" : "s3:GetObject",
          "Resource" : "arn:aws:s3:::herika-machado-950447966618/*",
          "Condition" : {
            "StringEquals" : {
              "AWS:SourceArn" : "arn:aws:cloudfront::${data.aws_caller_identity.current.id}:distribution/ELU0HE6NG0TGP"
            }
          }
        }
      ]
    }
  )
}