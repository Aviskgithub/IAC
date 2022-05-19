resource "aws_iam_role" "create_cluster" {
  name = "create-cluster"
  assume_role_policy  = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::359771743766:user/admin"
            },
            "Action": "sts:AssumeRole",
            "Condition": {}
        }
    ]
})
}
resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role = aws_iam_role.create_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_eks_cluster" "create_eks_cluster" {
  name = "terraform-cluster"
  role_arn = aws_iam_role.create_cluster.arn
  vpc_config {
    subnet_ids = var.subnets_for_cluster
  }
  depends_on = [
    aws_iam_role_policy_attachment.policy_attachment
  ]
}

