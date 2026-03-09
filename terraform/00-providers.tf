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
  default = "lab2"
}

provider "openstack" {
   cloud = "${var.openstack_rc}"
   use_octavia = true
}
