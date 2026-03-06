locals {
  all_hosts = [
    {
      name = openstack_compute_instance_v2.town-hall.name
      ip   = [for net in openstack_compute_instance_v2.town-hall.network : net.fixed_ip_v4 if net.name == "city"][0]
    }
  ]
}


output "ssh_config" {
  value = templatefile("ssh_config.tmpl", {
    hosts         = local.all_hosts
    rampart_ip    = openstack_compute_instance_v2.rampart.access_ip_v4
    arena_ip      = openstack_compute_instance_v2.arena.access_ip_v4
    watchtower_ip = openstack_compute_instance_v2.watchtower.access_ip_v4
  })
}

