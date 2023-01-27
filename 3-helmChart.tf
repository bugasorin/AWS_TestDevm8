# after running "aws eks update-kubeconfig --name <cluster_name> --region <region>" there will be a file generated
# in home folder unde ".kube/config",  the path can be changed with --kubeconfig parameter. 
# The next step is to use "kubectl" command
# ****************
# Another approach is to create a new folder - e.g: "eks_kubeconfig" where a file "main.tf" along with "variables.tf"
# should be present.

provider "helm" {}

resource "null_resource" "defineKubeconfig" {
  provisioner "local-exec" {
    command = "export KUBECONFIG=~/.kube/config"
  }
}

resource "helm_release" "fluent-bit" {

  name       = "Devm8-FluentBit"
  chart      = "./fluent-bit-0.22.0.tar"
  namespace  = "testFluentbit"
  depends_on = [null_resource.defineKubeconfig]

}
