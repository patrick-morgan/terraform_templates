output "kubeconfig" {
  value = "${module.eks.kubeconfig}"
}

output "aws-auth" {
  value = "${module.eks.aws-auth}"
}