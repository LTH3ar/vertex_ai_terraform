data "google_compute_network" "test_vpc_network" {
    name = var.vpc_network_name
}

data "google_compute_subnetwork" "test_vpc_subnet" {
    name = var.subnet_name
    region = var.region
}

resource "google_workbench_instance" "vertex_ai_instance" {
    count = var.isDeleted ? 0 : 1
    name = "${var.instance_prefix_name}-${var.user_name}"
    location = var.zone
    instance_owners = [var.user_email]
    desired_state = "ACTIVE"
    disable_proxy_access = false
    gce_setup {
        machine_type = var.machine_type
        boot_disk {
            disk_type = var.boot_disk_type
            disk_size_gb = var.boot_disk_size
        }

        data_disks {
            disk_type = var.data_disk_type
            disk_size_gb = var.data_disk_size
        }

        # accelerator_configs {
        #     type = var.accelerator_type
        #     core_count = var.accelerator_count
        # }

        network_interfaces {
            network = data.google_compute_network.test_vpc_network.self_link
            subnet = data.google_compute_subnetwork.test_vpc_subnet.self_link
        }

    }
    labels = {
        "owner" = var.user_name
        "test" = "true"
    }
}