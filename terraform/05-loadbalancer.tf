# ##############################
# # swiftproxy LOAD BALANCER
# ##############################
# # Create loadbalancer
# resource "openstack_lb_loadbalancer_v2" "swiftproxy" {
#   name          = "swiftproxy"
#   vip_subnet_id = openstack_networking_subnet_v2.swift.id
#   depends_on    = [openstack_compute_instance_v2.swiftproxy]
# }

# resource "openstack_networking_floatingip_v2" "float_swiftproxy" {
#   pool    = "${var.public-net}"
#   port_id = "${openstack_lb_loadbalancer_v2.swiftproxy.vip_port_id}"
#   depends_on    = [openstack_lb_loadbalancer_v2.swiftproxy]
# }

# # Create listener
# resource "openstack_lb_listener_v2" "swiftproxy80" {
#   name            = "listener_swiftproxy80"
#   protocol        = "HTTP"
#   protocol_port   = 80
#   loadbalancer_id = openstack_lb_loadbalancer_v2.swiftproxy.id
#   depends_on      = [openstack_lb_loadbalancer_v2.swiftproxy]
# }

# # Set load balancer mode to Round Robin between instances
# resource "openstack_lb_pool_v2" "swiftproxy80" {
#   name        = "pool_swiftproxy"
#   protocol    = "HTTP"
#   lb_method   = "ROUND_ROBIN"
#   listener_id = openstack_lb_listener_v2.swiftproxy80.id
#   depends_on  = [openstack_lb_listener_v2.swiftproxy80]
# }

# # Add swiftproxy instances to pool
# resource "openstack_lb_member_v2" "swiftproxy_port_80" {
#   count = 3
#   address = element(openstack_compute_instance_v2.swiftproxy.*.access_ip_v4,count.index)
#   name = "${element(openstack_compute_instance_v2.swiftproxy.*.name,count.index)}-80"
#   protocol_port = 80
#   pool_id       = openstack_lb_pool_v2.swiftproxy80.id
#   subnet_id     = openstack_networking_subnet_v2.swift.id
#   depends_on    = [openstack_lb_pool_v2.swiftproxy80]
# }

# # Create health monitor checking services listening properly
# resource "openstack_lb_monitor_v2" "swiftproxy80" {
#   name        = "monitor_swiftproxy"
#   pool_id     = openstack_lb_pool_v2.swiftproxy80.id
#   type        = "HTTP"
#   delay       = 2
#   timeout     = 2
#   max_retries = 3
#   expected_codes = "200"
#   depends_on  = [openstack_lb_member_v2.swiftproxy_port_80]
# }

# # Create listener pot 81
# resource "openstack_lb_listener_v2" "swiftproxy81" {
#   name            = "listener_swiftproxy81"
#   protocol        = "HTTP"
#   protocol_port   = 81
#   loadbalancer_id = openstack_lb_loadbalancer_v2.swiftproxy.id
#   depends_on      = [openstack_lb_loadbalancer_v2.swiftproxy]
# }

# # Set load balancer mode to Round Robin between instances
# resource "openstack_lb_pool_v2" "swiftproxy81" {
#   name        = "pool_swiftproxy81"
#   protocol    = "HTTP"
#   lb_method   = "ROUND_ROBIN"
#   listener_id = openstack_lb_listener_v2.swiftproxy81.id
#   depends_on  = [openstack_lb_listener_v2.swiftproxy81]
# }

# # Add swiftproxy instances to pool
# resource "openstack_lb_member_v2" "swiftproxy_port_81" {
#   count = 3
#   address = element(openstack_compute_instance_v2.swiftproxy.*.access_ip_v4,count.index)
#   name = "${element(openstack_compute_instance_v2.swiftproxy.*.name,count.index)}-81"
#   protocol_port = 81
#   pool_id       = openstack_lb_pool_v2.swiftproxy81.id
#   subnet_id     = openstack_networking_subnet_v2.swift.id
#   depends_on    = [openstack_lb_pool_v2.swiftproxy81]
# }

# # Create health monitor checking services listening properly
# resource "openstack_lb_monitor_v2" "swiftproxy81" {
#   name        = "monitor_swiftproxy81"
#   pool_id     = openstack_lb_pool_v2.swiftproxy81.id
#   type        = "HTTP"
#   delay       = 2
#   timeout     = 2
#   max_retries = 3
#   expected_codes = "200"
#   depends_on  = [openstack_lb_member_v2.swiftproxy_port_81]
# }

# # Listener for port 8443
# resource "openstack_lb_listener_v2" "controller_8443" {
#   name            = "listener_controller_8443"
#   protocol        = "HTTPS"
#   protocol_port   = 8443
#   loadbalancer_id = openstack_lb_loadbalancer_v2.swiftproxy.id
#   allowed_cidrs = ["10.8.0.0/16", "86.200.90.50/32", "84.16.66.81/32"]
#   depends_on      = [openstack_lb_loadbalancer_v2.swiftproxy]
# }

# # Listener for port 3000
# resource "openstack_lb_listener_v2" "controller_3000" {
#   name            = "listener_controller_3000"
#   protocol        = "HTTPS"
#   protocol_port   = 3000
#   loadbalancer_id = openstack_lb_loadbalancer_v2.swiftproxy.id
#   allowed_cidrs = ["10.8.0.0/16", "86.200.90.50/32", "84.16.66.81/32"]
#   depends_on      = [openstack_lb_loadbalancer_v2.swiftproxy]
# }

# # Pool for port 8443
# resource "openstack_lb_pool_v2" "controller_8443" {
#   name        = "pool_controller_8443"
#   protocol    = "HTTPS"
#   lb_method   = "SOURCE_IP"
#   listener_id = openstack_lb_listener_v2.controller_8443.id
#   depends_on  = [openstack_lb_listener_v2.controller_8443]
# }

# # Pool for port 3000
# resource "openstack_lb_pool_v2" "controller_3000" {
#   name        = "pool_controller_3000"
#   protocol    = "HTTPS"
#   lb_method   = "SOURCE_IP"
#   listener_id = openstack_lb_listener_v2.controller_3000.id
#   depends_on  = [openstack_lb_listener_v2.controller_3000]
# }

# # Add members for port 8443
# resource "openstack_lb_member_v2" "controller_8443" {
#   count = 3
#   address = element(openstack_compute_instance_v2.controller.*.access_ip_v4, count.index)
#   name = "${element(openstack_compute_instance_v2.controller.*.name, count.index)}-8443"
#   protocol_port = 8443
#   pool_id       = openstack_lb_pool_v2.controller_8443.id
#   subnet_id     = openstack_networking_subnet_v2.swift.id
#   depends_on    = [openstack_lb_pool_v2.controller_8443]
# }

# # Add members for port 3000
# resource "openstack_lb_member_v2" "controller_3000" {
#   count = 3
#   address = element(openstack_compute_instance_v2.controller.*.access_ip_v4, count.index)
#   name = "${element(openstack_compute_instance_v2.controller.*.name, count.index)}-3000"
#   protocol_port = 3000
#   pool_id       = openstack_lb_pool_v2.controller_3000.id
#   subnet_id     = openstack_networking_subnet_v2.swift.id
#   depends_on    = [openstack_lb_pool_v2.controller_3000]
# }

# # Create health monitor checking services listening properly
# resource "openstack_lb_monitor_v2" "controller_8443" {
#   name        = "monitor_dashboard"
#   pool_id     = openstack_lb_pool_v2.controller_8443.id
#   type        = "TCP"
#   delay       = 2
#   timeout     = 2
#   max_retries = 3
#   depends_on  = [openstack_lb_member_v2.controller_8443]
# }

# # Create health monitor checking services listening properly
# resource "openstack_lb_monitor_v2" "controller_3000" {
#   name        = "monitor_grafana"
#   pool_id     = openstack_lb_pool_v2.controller_3000.id
#   type        = "TCP"
#   delay       = 2
#   timeout     = 2
#   max_retries = 3
#   depends_on  = [openstack_lb_member_v2.controller_3000]
# }

# output "loadbbalancers-ip" {
#   description = "Public IP of Loadbalancer nad Bastion"
#   depends_on = [openstack_networking_floatingip_v2.float_swiftproxy,openstack_networking_floatingip_v2.float_bastion]
#   value = {
#     "Public IP swiftproxy"     = [ "${openstack_networking_floatingip_v2.float_swiftproxy.address}" ]
#     "Public IP bsation"     = [ "${openstack_networking_floatingip_v2.float_bastion.address}" ]
#   }
# }

