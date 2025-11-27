#======= GOOGLE DATA =======

data "google_container_cluster" "primary" {
  count      = var.gcp_cluster == true ? 1 : 0
  name       = module.gcp.gcp_cluster_name
  location   = module.gcp.gcp_cluster_location
  depends_on = [ module.gcp ]
}

data "external" "gke_token" {
  count      = var.gcp_cluster == true ? 1 : 0
  program    = ["bash", "-c", "echo '{\"token\": \"'$(gcloud auth print-access-token)'\"}'"]
  depends_on = [ module.gcp ]
}

#======= AWS DATA =======

data "aws_eks_cluster" "cluster" {
  count      = var.aws_cluster == true ? 1 : 0
  name       = module.aws.eks_cluster_name
  depends_on = [module.aws]
}


data "aws_eks_cluster_auth" "cluster_auth" {
  count      = var.aws_cluster == true ? 1 : 0
  name       = module.aws.eks_cluster_name
  depends_on = [module.aws]
}
