terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Namespace para el entorno
resource "kubernetes_namespace" "caper" {
  metadata {
    name = var.namespace_name
    labels = {
      environment = var.environment
      managed-by  = "terraform"
      project     = "caper"
    }
  }
}

# Namespace para el entorno de desarrollo (opcional)
resource "kubernetes_namespace" "caper_dev" {
  count = var.environment == "dev" ? 1 : 0
  metadata {
    name = "caper-dev"
    labels = {
      environment = "dev"
      managed-by  = "terraform"
      project     = "caper"
    }
  }
}
