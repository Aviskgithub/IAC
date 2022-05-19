output "cluster_endpoint" {
  value = aws_eks_cluster.create_eks_cluster.endpoint
}
output "cluster_total" {
  value = aws_eks_cluster.create_eks_cluster
}