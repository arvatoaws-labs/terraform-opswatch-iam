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
  name = "TagsPolicy"
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
  role   = aws_iam_role.opswatch.id
}

resource "aws_iam_role_policy" "describe" {
  name = "DescribePolicy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "acm:DescribeCertificate",
        "cloudfront:GetDistribution",
        "route53:GetHealthCheck",
        "elasticfilesystem:DescribeFileSystems",
        "ec2:DescribeVolumes",
        "ec2:DescribeInstances",
        "ec2:DescribeInstanceCreditSpecifications",
        "dynamodb:DescribeTable",
        "sqs:GetQueueAttributes",
        "rds:DescribeDBInstances",
        "ec2:DescribeInstanceTypes",
        "rds:DescribeDBClusters",
        "rds:DescribeDBClusterParameters",
        "rds:DescribeDBParameters",
        "es:DescribeElasticsearchDomain",
        "es:ListElasticsearchVersions",
        "elasticache:DescribeCacheClusters",
        "elasticache:DescribeCacheEngineVersions",
        "elasticache:DescribeReplicationGroups",
        "elasticache:DescribeUpdateActions",
        "es:DescribeElasticsearchDomain",
        "es:ListElasticsearchVersions",
        "rds:DescribeDBEngineVersions",
        "lambda:GetFunctionConfiguration",
        "eks:DescribeCluster",
        "eks:DescribeAddonVersions",
        "eks:ListAddons",
        "eks:DescribeAddon",
        "eks:ListNodegroups",
        "eks:DescribeNodegroup",
        "ssm:GetParameter",
        "ssm:DescribeParameters",
        "ec2:DescribeImages"
      ]
      Resource = "*"
    }]
  })
  role   = aws_iam_role.opswatch.id
}