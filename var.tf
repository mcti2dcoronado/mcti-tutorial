variable "project_id" {
  description = "mcti project id"
  default     = "montreal-project-mcit"
  type = string
}

variable "backend_name" {
  default   = "backendfetchdata"
  type      = string
}

variable "load_balancing_scheme" {
  description = "Load balancing scheme type (EXTERNAL for classic external load balancer, EXTERNAL_MANAGED for Envoy-based load balancer, and INTERNAL_SELF_MANAGED for traffic director)"
  type        = string
  default     = "EXTERNAL_MANAGED"
}
