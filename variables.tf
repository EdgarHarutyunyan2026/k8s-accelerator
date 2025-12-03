#======= AWS CLUSTER =======

variable "aws_cluster" {
  default = false
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "aws_subnet_count" {
  default = 2
}

variable "aws_enable_dns_hostnames" {
  default = true
}

variable "aws_enable_dns_support" {
  default = true
}

variable "aws_vpc" {
  default = "10.0.0.0/16"
}

variable "aws_cluster_name" {
  default = "k8s-cluster"
}

variable "aws_node_group_name" {
  default = "k8s-node-group"
}

variable "aws_sg_name" {
  default = "k8s-sg"
}

variable "aws_ports" {
  default = ["80", "443"]
}

variable "aws_cluster_role_name" {
  default = "eks-cluster-role"
}

variable "aws_cluster_service" {
  default = "eks.amazonaws.com"
}

variable "aws_cluster_action" {
  default = "sts:AssumeRole"
}

variable "aws_node_role_name" {
  default = "eks-worker-role"
}

variable "aws_node_service" {
  default = "ec2.amazonaws.com"
}

variable "aws_node_action" {
  default = "sts:AssumeRole"
}

variable "aws_cluster_policy_arn" {
  default = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

variable "aws_cluster_service_policy_arn" {
  default = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

#======= GCP CLUSTER =======

variable "gcp_cluster" {
  default = true
}

variable "gcp_project" {
  default = "prod-477310"
}

variable "gcp_cluster_name" {
  default = "gcp-k8s-cluster"
}

variable "gcp_vpc_name" {
  default = "gcp-k8s-vpc"
}

variable "gcp_auto_create_subnetworks" {
  default = "true"
}

variable "gcp_region" {
  default = "us-central1-a"
}

variable "gcp_node_pool_name" {
  default = "k8s-node-pool"
}

variable "gcp_node_count" {
  default = 3
}

variable "gcp_machine_type" {
  default = "e2-medium"
}

variable "gcp_min_node_count" {
  default = 1
}

variable "gcp_max_node_count" {
  default = 4
}

#======= HELM APPLICATINS =======

variable "grafana_name" {
  default = "grafana"
}

variable "grafana" {
  default = false
}

variable "grafana_namespace" {
  default = "grafana"
}

variable "grafana_chart" {
  default = "grafana"
}

variable "grafana_version" {
  default = "10.1.4"
}

variable "grafana_repository" {
  default = "https://grafana.github.io/helm-charts"
}

variable "grafana_create_namespace" {
  default = false
}

#======= ARGO CD =======

variable "argocd" {
  default = false
}

variable "argocd_name" {
  default = "argocd"
}

variable "argocd_namespace" {
  default = "argocd"
}

variable "argocd_chart" {
  default = "argo-cd"
}

variable "argocd_version" {
  default = "5.0.0"
}

variable "argocd_repository" {
  default = "https://argoproj.github.io/argo-helm"
}

variable "argocd_create_namespace" {
  default = false
}

#======= NGINX CONTROLER =======

variable "nginx_controler" {
  default = false
}

variable "nginx_controler_name" {
  default = "nginx-ingress"
}

variable "nginx_controler_namespace" {
  default = "ingress-nginx"
}

variable "nginx_controler_chart" {
  default = "ingress-nginx"
}

variable "nginx_controler_version" {
  default = "4.12.3"
}

variable "nginx_controler_repositor" {
  default = "https://kubernetes.github.io/ingress-nginx"
}

variable "nginx_controler_create_namespace" {
  default = false
}

#======= PROMETHEUS =======

variable "prometheus_name" {
  default = "prometheus"
}

variable "prometheus" {
  default = false
}

variable "prometheus_namespace" {
  default = "prometheus"
}

variable "prometheus_chart" {
  default = "prometheus"
}

variable "prometheus_version" {
  default = "27.45.0"
}

variable "prometheus_repository" {
  default = "https://prometheus-community.github.io/helm-charts"
}

variable "prometheus_create_namespace" {
  default = false
}

#======= LOKI =======

variable "loki_name" {
  default = "loki"
}

variable "loki" {
  default = false
}

variable "loki_namespace" {
  default = "loki"
}

variable "loki_chart" {
  default = "loki"
}

variable "loki_version" {
  default = "6.46.0"
}

variable "loki_repository" {
  default = "https://grafana.github.io/helm-charts"
}

variable "loki_create_namespace" {
  default = true
}

variable "loki_application_values" {
  default = []
}

#======= SECRETS STORE  =======


variable "secrets_store" {
  default = false
}

variable "secrets_store_name" {
  default = "secrets-store"
}

variable "secrets_store_chart" {
  default = "secrets-store-csi-driver"
}

variable "secrets_store_version" {
  default = "10.1.4"
}

variable "secrets_store_repository" {
  default = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
}

variable "secrets_store_namespace" {
  default = "secrets_store"
}

variable "secrets_store_create_namespace" {
  default = false
}


#======= EXTERNAL DNS  =======

variable "external_dns" {
  default = false
}

variable "external_dns_name" {
  default = "external-dns"
}

variable "external_dns_namespace" {
  default = "external-dns"
}

variable "external_dns_chart" {
  default = "external-dns"
}

variable "external_dns_version" {
  default = "1.19.0"
}

variable "external_dns_repository" {
  default = "https://kubernetes-sigs.github.io/external-dns"
}


variable "external_dns_create_namespace" {
  default = false
}
