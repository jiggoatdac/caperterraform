output "namespace" {
  description = "Nombre del namespace creado"
  value       = kubernetes_namespace.caper.metadata[0].name
}

output "environment" {
  description = "Entorno donde se creó la infraestructura"
  value       = var.environment
}

output "namespace_labels" {
  description = "Etiquetas del namespace"
  value       = kubernetes_namespace.caper.metadata[0].labels
}

# Output para usar en el pipeline de despliegue
output "deployment_target" {
  description = "Namespace para el despliegue de la aplicación"
  value       = kubernetes_namespace.caper.metadata[0].name
}
