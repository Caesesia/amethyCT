# Public network
data "openstack_networking_network_v2" "public" {
  name       = var.public-net
}

data "openstack_networking_network_v2" "floating" {
  name = var.floating-net
}

################
# city network #
################
resource "openstack_networking_network_v2" "city" {
  name           = "city"
  admin_state_up = "true"
}

# Create Subnet
resource "openstack_networking_subnet_v2" "city-in" {
  name            = "city-in"
  network_id      = "${openstack_networking_network_v2.city.id}"
  cidr            = "10.0.0.0/24"
  ip_version      = 4
  dns_nameservers = ["83.166.143.51", "83.166.143.52"]
}

##############
# city ports #
##############
resource "openstack_networking_port_v2" "town-hall_port" {
  name        = "town-hall-port"
  network_id  = openstack_networking_network_v2.city.id
  port_security_enabled = true
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.city-in.id
    ip_address = "10.0.0.101"
  }
}
