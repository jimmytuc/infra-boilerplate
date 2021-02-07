resource "kubernetes_deployment" "td" {
  metadata {
    name = var.app
    labels = {
      app = var.app
    }
  }
  spec {
    replicas = var.replica
    selector {
      app  = "td-deployment"
      role = "master"
      tier = "backend"

      match_labels = {
        app = var.app
      }
    }
    template {
      metadata {
        labels = {
          app = var.app
        }
      }
      spec {

        container {
          image = var.docker_image
          name = var.app
          port {
            name = "port-8080"
            container_port = 8080
          }
          env_from {
            config_map_ref {
              name = kubernetes_config_map.backend.metadata.0.name
            }
          }
          resources {
            limits {
              cpu = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
