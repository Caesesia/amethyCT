# Define required providers
terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.44.0"
    }
  }
}

# Configure the OpenStack Provider
variable "openstack_rc" {
  default = "PCP-A9ZS8GV-dc4-a"
}

provider "openstack" {
   cloud = "${var.openstack_rc}"
   use_octavia = true
}
