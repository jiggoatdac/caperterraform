variable "environment" {
  description = "Entorno donde se desplegará la infraestructura (dev, qa, prod)"
  type        = string
  default     = "qa"
  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "El entorno debe ser dev, qa o prod."
  }
}

variable "namespace_name" {
  description = "Nombre del namespace de Kubernetes"
  type        = string
  default     = "caper-qa"
}

variable "kube_config_path" {
  description = "Ruta al archivo kubeconfig"
  type        = string
  default     = "~/.kube/config"
}
