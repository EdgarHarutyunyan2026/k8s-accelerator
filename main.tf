#======= AWS  =======

module "aws" {
  source            = "git::https://github.com/EdgarHarutyunyan2026/k8s-accelerator-modules//cluster/aws"
  aws_cluster_count = var.aws_cluster == true ? 1 : 0

  #======= VPC =======
  region               = var.aws_region 
  eks_vpc              = var.aws_vpc
  eks_subnet_count     = var.aws_subnet_count
  enable_dns_hostnames = var.aws_enable_dns_hostnames
  enable_dns_support   = var.aws_enable_dns_support

  #======= CLUSTER =======
  eks_cluter_name   = var.aws_cluster_name
  node_group_name   = var.aws_node_group_name
  sg_name           = var.aws_sg_name
  ports             = var.aws_ports
  
  #======= ROLE =======
  cluster_role_name          = var.aws_cluster_role_name
  cluster_service            = var.aws_cluster_service
  cluster_action             = var.aws_cluster_action
  node_role_name             = var.aws_node_role_name
  node_service               = var.aws_node_service
  node_action                = var.aws_node_action
  cluster_policy_arn         = var.aws_cluster_policy_arn
  cluster_service_policy_arn = var.aws_cluster_service_policy_arn
}

#======= GCP  =======

module "gcp" {
  source            = "git::https://github.com/EdgarHarutyunyan2026/k8s-accelerator-modules//cluster/gcp"
  gcp_cluster_count = var.gcp_cluster == true ? 1 : 0

  vpc_name                = var.gcp_vpc_name
  auto_create_subnetworks = var.gcp_auto_create_subnetworks
  cluster_name            = var.gcp_cluster_name
  region                  = var.gcp_region
  node_pool_name          = var.gcp_node_pool_name
  node_count              = var.gcp_node_count
  machine_type            = var.gcp_machine_type
  min_node_count          = var.gcp_min_node_count
  max_node_count          = var.gcp_max_node_count

}


#======= NGINX CONTROLER =======

module "nginx_ingress" {
  source          = "git::https://github.com/EdgarHarutyunyan2026/k8s-accelerator-modules//helm_release/nginx_ingress"

  nginx_controler                  = var.nginx_controler
  nginx_controler_namespace        = var.nginx_controler_namespace
  nginx_controler_create_namespace = var.nginx_controler_create_namespace

  providers  = { helm = helm }
  depends_on = [ module.gcp,module.aws ]
}

#======= ARGO CD =======

module "argo_cd" {
  source     = "git::https://github.com/EdgarHarutyunyan2026/k8s-accelerator-modules//helm_release/argo_cd"

  argocd                  = var.argocd
  argocd_namespace        = var.argocd_namespace
  argocd_create_namespace = var.argocd_create_namespace

  providers = { helm = helm }
  depends_on = [ module.gcp,module.aws ]
}

#======= GRAFANA  =======

module "grafana" {
  source     = "git::https://github.com/EdgarHarutyunyan2026/k8s-accelerator-modules//helm_release/grafana"

  grafana                  = var.grafana
  grafana_namespace        = var.grafana_namespace
  grafana_create_namespace = var.grafana_create_namespace

  providers  = { helm = helm }
  depends_on = [ module.gcp,module.aws ]
}


#======= LOKI  =======

module "loki" {
  source     = "../k8s-accelerator-modules/helm_release/loki"

  loki                  = var.loki
  loki_namespace        = var.loki_namespace
  loki_create_namespace = var.loki_create_namespace

  loki_application_values = [
    file("./values/loki-values.yaml")
  ]

  providers  = { helm = helm }
  depends_on = [ module.gcp,module.aws ]
}



#======= PROMETHEUS  =======

module "prometheus" {
  source     = "../k8s-accelerator-modules/helm_release/prometheus"

  prometheus                  = var.prometheus
  prometheus_namespace        = var.prometheus_namespace
  prometheus_create_namespace = var.prometheus_create_namespace

  providers  = { helm = helm }
  depends_on = [ module.gcp,module.aws ]
}


#======= SECRETS STORE  =======

module "secrets-store" {
  source     = "../k8s-accelerator-modules/helm_release/secrets-store"

  secrets_store                  = var.secrets_store
  secrets_store_namespace        = var.secrets_store_namespace
  secrets_store_create_namespace = var.secrets_store_create_namespace


  providers  = { helm = helm }
  depends_on = [ module.gcp,module.aws ]
}

#======= EXTERNAL DNS  =======

module "external-dns" {
  source     = "../k8s-accelerator-modules/helm_release/external-dns"

  external_dns                  = var.external_dns
  external_dns_namespace        = var.external_dns_namespace
  external_dns_create_namespace = var.external_dns_create_namespace


  providers  = { helm = helm }
  depends_on = [ module.gcp,module.aws ]
}
