# Skyatlas Public Network
variable "public-net" {
  default = "ext-net1"
}

# Floating IP network
variable "floating-net" {
  default = "ext-floating1"
}

# Flavor for rampart instance
variable "rampart_flavor_name" {
  default = "a1-ram4-disk20-perf1"
}

# Flavor for town-hall instance
variable "town-hall_flavor_name" {
  default = "a1-ram4-disk50-perf1"
}

# Flavor for arena
variable "arena_flavor_name" {
  default = "a4-ram16-disk50-perf1"
}

# Flavor for watchtower instance
variable "watchtower_flavor_name" {
  default = "a2-ram4-disk80-perf1"
}

# Image for instances
variable "image_name" {
  default = "Debian 12 bookworm"
}

variable "ssh_user_name" {
  default = "debian"
}

variable "ssh-key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC4rYHdeDl3BnhZWRsVwoCgHgkOwauN1NKoXdedRQ/KFIgleG+mrfW7eBmH/Ngz4jrY9Rk2rqe3OVXlqA/j3IbZ9kZGXaLPmRb2DHzpVo7xstkZnvgVQfVGVk4knqYEvfQpbL4fGY/BBQFrT7JSJk4jWXzGuZgdcVAfCoVzYQHWFOrEe5rJ2XsJsDCr5x5gkNYWxMIGKBugSUkQ5fX6YoT0exCsnc7LevHNzS1RxCI6jHS2HALvX+xPcYZD3jRxQOaZhfH45xwx1QFvBlxJQWGvnyAu4yb7PhFtT5AO/dYF+BwV4E0lGYkzdlrkTEUq2AlIe00szulD2Xh/+LzgOBy5AjN4Wo9zDpP+2uCpa6qwlPkZHK9WmqQ9jlzhLdofUpRxLnh9jB+cv3qQbkJhn85b1q8ScUMBCAnjRSNg0aPiYFwaL0yijD4Rn8/DpSoS4bGaOVmQNusskKEsAPwMruHjDRY5SJeKlHZymBVVj6i59dLCKUdkGnEMC3aI6tHyZscv+diZL6d7UuViOKbWC6G7TG7pt9jeYHjy3AiEbRfZQnwus0S0RvVDVS5tbfBMjyIakAAM2+aGjV1AIBOTQiYnwjEAVwePZlHPz5v8sjdsA7QfGVzyRqZNdgovWxriv6dxvRJltoknQFUxw+Btwq5ousjH+l+kNkJfKBwlez1BrQ== cardno:6708604\n"
}

# Create ssh-key
resource "openstack_compute_keypair_v2" "ssh-key" {
  name       = "ssh-key"
  public_key = "${var.ssh-key}"
}
