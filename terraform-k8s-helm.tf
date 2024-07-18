provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "terraform_k8s" {
  name       = "terraform-k8s"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "terraform-k8s"

  set {
    name  = "replicaCount"
    value = "1"
  }
  set {
    name  = "image.repository"
    value = "hashicorp/terraform-k8s"
  }
  set {
    name  = "image.tag"
    value = "latest"
  }
}
