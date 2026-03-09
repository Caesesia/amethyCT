############################
# Create rampart Instances #
############################

# Create rampart anti-affinity group

resource "openstack_compute_servergroup_v2" "sg-anti-affinity-1" {
  name     = "sg-anti-affinity-1"
  policies = ["soft-anti-affinity"]
}

# Create instances
resource "openstack_compute_instance_v2" "rampart" {
  name            = "rampart"
  flavor_name     = "${var.rampart_flavor_name}"
  image_name      = "${var.image_name}"
  key_pair        = "${openstack_compute_keypair_v2.ssh-key.name}"
  security_groups = ["${openstack_networking_secgroup_v2.rampart_sec_group.name}"]

  network {
    name = var.public-net
  }

#  network {
#    name = "city"
#    fixed_ip_v4 = "10.0.0.1"
#  }

  depends_on    = [openstack_networking_subnet_v2.city-in]
  scheduler_hints {
    group = openstack_compute_servergroup_v2.sg-anti-affinity-1.id
  }


  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
  EOF
}

#############################
# Create town-hall Instance #
#############################

# Create town-hall anti-affinity group

resource "openstack_compute_servergroup_v2" "sg-anti-affinity-4" {
  name     = "sg-anti-affinity-4"
  policies = ["soft-anti-affinity"]
}

# Create instances
resource "openstack_compute_instance_v2" "town-hall" {
  name            = "town-hall"
  flavor_name     = "${var.town-hall_flavor_name}"
  image_name      = "${var.image_name}"
  key_pair        = "${openstack_compute_keypair_v2.ssh-key.name}"
  security_groups = ["${openstack_networking_secgroup_v2.town-hall_sec_group.name}"]

  network {
    port = openstack_networking_port_v2.town-hall_port.id
  }

  depends_on    = [openstack_networking_subnet_v2.city-in]
  scheduler_hints {
    group = openstack_compute_servergroup_v2.sg-anti-affinity-4.id
  }


  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
  EOF
}

#########################
# Create arena Instance #
#########################

# Create arena anti-affinity group
resource "openstack_compute_servergroup_v2" "sg-anti-affinity-2" {
  name     = "sg-anti-affinity-2"
  policies = ["soft-anti-affinity"]
}

# Create arena instance on public network directly
resource "openstack_compute_instance_v2" "arena" {
  name            = "arena"
  flavor_name     = var.arena_flavor_name
  image_name      = var.image_name
  key_pair        = openstack_compute_keypair_v2.ssh-key.name
  security_groups = [openstack_networking_secgroup_v2.arena_sec_group.name]

  network {
    name = var.public-net
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
  EOF
}

##############################
# Create watchtower instance #
##############################

# Create watchtower anti-affinity group
resource "openstack_compute_servergroup_v2" "sg-anti-affinity-3" {
  name     = "sg-anti-affinity-3"
  policies = ["soft-anti-affinity"]
}

# Create watchtower instance on public network directly
resource "openstack_compute_instance_v2" "watchtower" {
  name            = "watchtower"
  flavor_name     = var.watchtower_flavor_name
  image_name      = var.image_name
  key_pair        = openstack_compute_keypair_v2.ssh-key.name
  security_groups = [openstack_networking_secgroup_v2.watchtower_sec_group.name]

  network {
    name = var.public-net
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
  EOF
}
