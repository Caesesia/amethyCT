##############################################
# Create Security Group For rampart Instances
##############################################
resource "openstack_networking_secgroup_v2" "rampart_sec_group" {
  name        = "rampart"
  description = "Security group for the rampart instance"
}

# Allow SSH from home
resource "openstack_networking_secgroup_rule_v2" "ssh-rampart-home" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "82.66.247.210/32"
  security_group_id = "${openstack_networking_secgroup_v2.rampart_sec_group.id}"
}

# Allow SSH from IK internal
resource "openstack_networking_secgroup_rule_v2" "ssh-rampart-ik-internal" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "84.16.66.35/32"
  security_group_id = "${openstack_networking_secgroup_v2.rampart_sec_group.id}"
}

# Allow HTTP
resource "openstack_networking_secgroup_rule_v2" "http-rampart" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.rampart_sec_group.id}"
}

# Allow HTTPS
resource "openstack_networking_secgroup_rule_v2" "https-rampart" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.rampart_sec_group.id}"
}

# Allow 25565
resource "openstack_networking_secgroup_rule_v2" "rampart_25565" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 25565
  port_range_max    = 25565
  remote_ip_prefix  = "82.66.247.210/32"
  security_group_id = "${openstack_networking_secgroup_v2.rampart_sec_group.id}"
}

# Allow icmp from home
resource "openstack_networking_secgroup_rule_v2" "icmp-rampart-home" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "82.66.247.210/32"
  security_group_id = "${openstack_networking_secgroup_v2.rampart_sec_group.id}"
}

# Allow icmp from IK
resource "openstack_networking_secgroup_rule_v2" "icmp-rampart-ik" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "84.16.66.35/32"
  security_group_id = "${openstack_networking_secgroup_v2.rampart_sec_group.id}"
}

################################################
# Create Security Group For town-hall instance #
################################################
resource "openstack_networking_secgroup_v2" "town-hall_sec_group" {
  name        = "town-hall"
  description = "Security group for the town-hall instances"
}

# Allow SSH from LAN
resource "openstack_networking_secgroup_rule_v2" "ssh-town-hall-lan" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "10.0.0.0/24"
  security_group_id = "${openstack_networking_secgroup_v2.town-hall_sec_group.id}"
}

# Allow 8008
resource "openstack_networking_secgroup_rule_v2" "town-hall_8008" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8008
  port_range_max    = 8008
  remote_ip_prefix  = "10.0.0.1/32"
  security_group_id = "${openstack_networking_secgroup_v2.town-hall_sec_group.id}"
}

# Allow icmp
resource "openstack_networking_secgroup_rule_v2" "icmp-town-hall" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "10.0.0.0/24"
  security_group_id = "${openstack_networking_secgroup_v2.town-hall_sec_group.id}"
}

# Allow 7881
resource "openstack_networking_secgroup_rule_v2" "7881-town-hall" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 7881
  port_range_max    = 7881
  remote_ip_prefix  = "10.0.0.0/24"
  security_group_id = "${openstack_networking_secgroup_v2.town-hall_sec_group.id}"
}

# Allow 50000-50100
resource "openstack_networking_secgroup_rule_v2" "big-range-town-hall" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 50000
  port_range_max    = 50100
  remote_ip_prefix  = "10.0.0.0/24"
  security_group_id = "${openstack_networking_secgroup_v2.town-hall_sec_group.id}"
}

############################################
# Create Security Group For arena instance #
############################################
resource "openstack_networking_secgroup_v2" "arena_sec_group" {
  name        = "arena"
  description = "Security group for the arena instances"
}

# Allow port 22 from LAN
resource "openstack_networking_secgroup_rule_v2" "ssh-arena-lan" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "10.0.0.1/32"
  security_group_id = "${openstack_networking_secgroup_v2.arena_sec_group.id}"
}

# Allow port 22 from home
resource "openstack_networking_secgroup_rule_v2" "ssh-arena-home" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "82.66.247.210/32"
  security_group_id = "${openstack_networking_secgroup_v2.arena_sec_group.id}"
}

# Allow port 22 from IK
resource "openstack_networking_secgroup_rule_v2" "ssh-arena-ik" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "84.16.66.35/32"
  security_group_id = "${openstack_networking_secgroup_v2.arena_sec_group.id}"
}

# Allow 25565
resource "openstack_networking_secgroup_rule_v2" "arena_25565" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 25565
  port_range_max    = 25565
  remote_ip_prefix  = "10.0.0.1/32"
  security_group_id = "${openstack_networking_secgroup_v2.arena_sec_group.id}"
}

# Allow icmp
resource "openstack_networking_secgroup_rule_v2" "icmp-arena" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "10.0.0.0/24"
  security_group_id = "${openstack_networking_secgroup_v2.arena_sec_group.id}"
}

#################################################
# Create Security Group For watchtower instance #
#################################################
resource "openstack_networking_secgroup_v2" "watchtower_sec_group" {
  name        = "watchtower"
  description = "Security group for the watchtower instances"
}

# Allow port 22
resource "openstack_networking_secgroup_rule_v2" "ssh-watchtower" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.watchtower_sec_group.id}"
}
