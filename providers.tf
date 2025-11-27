#======= PROVIDERS VERSION =======

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket       = "k8s-accelerator"
    key          = "dev/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
    #dynamodb_table = "terraform-locks"
  }

}

#======= PROVIDERS =======

provider "google" {
  credentials = file("/home/edgar/DevOps/google/google-cloud/prod-477310-607508ad8fed.json")
  project     = var.gcp_project
  region      = var.gcp_region
}

provider "aws" {
  region = var.aws_region
}



#======= HELM PROVIDER =========

provider "helm" {
  #  alias = "clouds"

  kubernetes {
    host = (var.aws_cluster == true ? data.aws_eks_cluster.cluster[0].endpoint :
      (var.gcp_cluster == true ? data.google_container_cluster.primary[0].endpoint :
    null))

    token = (var.aws_cluster == true ? data.aws_eks_cluster_auth.cluster_auth[0].token :
      (var.gcp_cluster == true ? data.external.gke_token[0].result.token :
    null))

    cluster_ca_certificate = (var.aws_cluster == true ? base64decode(data.aws_eks_cluster.cluster[0].certificate_authority[0].data) :
      (var.gcp_cluster == true ? base64decode(data.google_container_cluster.primary[0].master_auth.0.cluster_ca_certificate) :
    null))

  }
}
