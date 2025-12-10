resource "aws_kms_key" "sops" {
  count = var.create_kms_for_sops ? 1 : 0

  description             = "KMS key for SOPS encrypted secrets for ${var.cluster_name}"
  deletion_window_in_days = 30

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "key-default-1",
  "Statement": [
    {
      "Sid": "Allow administration of the key",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${data.aws_caller_identity.current.account_id}"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY
}

resource "aws_kms_alias" "sops_alias" {
  count = var.create_kms_for_sops ? 1 : 0
  name  = "alias/${var.cluster_name}-sops"
  target_key_id = aws_kms_key.sops[0].key_id
}

data "aws_caller_identity" "current" {}
