# # Output the kubeconfig
# output "kubeconfig" {
#   value = aws_eks_cluster.cbz_cluster.identity[0].oidc.issuer
#   description = "Run 'aws eks update-kubeconfig --name cbz-cluster' to configure kubeconfig"
# }
output "eks_name" {
  value = aws_eks_cluster.cbz_cluster.name
}