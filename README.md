** Setup a regional External Application Load Balancer with Cloud Run **


-- REFERENCES --
- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_endpoint_group

- https://cloud.google.com/load-balancing/docs/https/setup-global-ext-https-external-backend?hl=es-419

- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_service

- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map

- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_http_proxy

- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule


** google_compute_region_network_endpoint_group

required: 
- name
- region

optional: 
- description
- network_endpoint_type [SERVERLESS: Default | PRIVATE_SERVICE_CONNECT]
- network [default]
- cloud_function Only valid when networkEndpointType is "SERVERLESS"
- projet 

cloud_function block:
- function
- url_mask  URL mask allows for routing to multiple Cloud Functions without having to create multiple Network Endpoint Groups and backend services.

serverless_deployment block:
- platform required - NEG backend target. apigateway.googleapis.com
- resource
- version
- url_mask

Attributes
- id an identifier for the resource - projects/{{project}}/regions/{{region}}/networkEndpointGroups/{{name}}
- self_link - URI of the created resource

** google_compute_backend_service

required:
- name

optional:
- affinity_cookie_ttl_sec 0
- backend Set of backends that server this BackendService
- connection_draining_timeout_sec - time for which instance will be drained
- health_checks The set of URLs to th HttpHealthCheck or HttpsHealthCheck. A health check must be specified unless the backend service uses an internet or serverless NEG as a backend. 
- load_balancing_scheme EXTERNAL_MANAGED
- locality_lb_policy ROUND_ROBIN
- port_name
- protocol "HTTP"
- session_affinity "NONE"
- timeout_sec 45
- project
- log_config
- backend block
    required
        - group

Attributes
- id
- self_link

