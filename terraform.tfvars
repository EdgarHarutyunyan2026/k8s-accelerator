#======================================================= CLUSTER ===================================================================

#======= AWS CLUSTER =======

aws_cluster                    = true
aws_region                     = "eu-central-1"
aws_vpc                        = "10.0.0.0/16"
aws_subnet_count               = 2
aws_enable_dns_hostnames       = true
aws_enable_dns_support         = true
aws_cluster_name               = "k8s-cluster"
aws_node_group_name            = "k8s-node-group"
aws_sg_name                    = "k8s-sg"
aws_ports                      = ["80", "443"]
aws_cluster_role_name          = "eks-cluster-role"
aws_cluster_service            = "eks.amazonaws.com"
aws_cluster_action             = "sts:AssumeRole"
aws_node_role_name             = "eks-worker-role"
aws_node_service               = "ec2.amazonaws.com"
aws_node_action                = "sts:AssumeRole"
aws_cluster_policy_arn         = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
aws_cluster_service_policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"

#======= GCP CLUSTER =======

gcp_cluster                 = false
gcp_region                  = "us-central1-a"
gcp_project                 = "prod-477310"
gcp_cluster_name            = "k8s-cluster"
gcp_vpc_name                = "gcp-k8s-vpc"
gcp_auto_create_subnetworks = "true"
gcp_node_pool_name          = "k8s-node-pool"
gcp_node_count              = 3
gcp_machine_type            = "e2-medium"
gcp_min_node_count          = 1
gcp_max_node_count          = 3


#================================================ HELM APPLICATIONS ================================================================

#======= GRAFANA =======

grafana                  = true
grafana_namespace        = "grafana"
grafana_create_namespace = true

#======= ARGO CD =======

argocd                  = true
argocd_namespace        = "argocd"
argocd_create_namespace = true

#======= NGINX CONTROLER =======

nginx_controler                  = false
nginx_controler_namespace        = "ingress-nginx"
nginx_controler_create_namespace = true
