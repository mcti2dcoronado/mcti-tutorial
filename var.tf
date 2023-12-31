variable "project_id" {
  description = "mcti project id"
  default     = "montreal-project-mcit"
  type = string
}

variable "load_balancing_scheme" {
  description = "Load balancing scheme type (EXTERNAL for classic external load balancer, EXTERNAL_MANAGED for Envoy-based load balancer, and INTERNAL_SELF_MANAGED for traffic director)"
  type        = string
  default     = "EXTERNAL_MANAGED"
}

variable "my_neg_name" {
  description = "My NEGs names"
  default       =   "function-neg-"
  type          =   string
}

variable "backend_name" {
    type = map(string)
    default = {
        my-backend-1 = "northamerica-northeast1"
        my-backend-2 = "us-central1"
        my-backend-3 = "northamerica-northeast1"
        my-backend-4 = "us-central1"
    }
}
