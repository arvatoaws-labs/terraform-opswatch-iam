variable "opswatch_role_principal" {
  type = string
  description = "Who is allowed to assume the role, so where is the OpsWatch instance running"
}

resource "aws_iam_role" "opswatch" {
  name = "OpsWatchRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = var.opswatch_role_principal
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "tags" {
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid = "GenericTagApi"
      Effect = "Allow"
      Action = [
        "tag:GetResources"
      ]
      Resource = "*"
    }, {
      Sid = "CustomTagApis"
      Effect = "Allow"
      Action = [
        "cloudfront:ListTagsForResource",
        "route53:ListTagsForResource",
        "ec2:DescribeTags",
      ]
      Resource = "*"
    }]
  })
  role   = aws_iam_role.cloudwatch.id
}

resource "aws_iam_role_policy" "describe" {
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "acm:DescribeCertificate",
        "cloudfront:GetDistribution",
        "route53:GetHealthCheck",
        "efs:DescribeFileSystems",
        "ec2:DescribeVolumes",
        "ec2:DescribeInstances",
        "ec2:DescribeInstanceCreditSpecifications",
        "dynamodb:DescribeTable",
        "sqs:GetQueueAttributes",
        "rds:DescribeDBInstances",
        "ec2:DescribeInstanceTypes",
        "rds:DescribeDBClusters",
        "rds:DescribeDBClusterParameters",
        "rds:DescribeDBParameters"
      ]
      Resource = "*"
    }]
  })
  role   = aws_iam_role.cloudwatch.id
}