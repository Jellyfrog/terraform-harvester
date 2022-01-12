resource "harvester_network" "vlan59" {
  depends_on = [harvester_clusternetwork.vlan]
  name      = "vlan59"
  namespace = "default"

  vlan_id = 59
}

