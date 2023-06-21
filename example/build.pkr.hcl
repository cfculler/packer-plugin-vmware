# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

packer {
  required_version = ">= 1.7.0"
  required_plugins {
    vmware = {
      version = ">= 1.0.7"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

build {
  sources = ["source.vmware-iso.debian"]
  provisioner "shell" {
    environment_vars = [
      //"WHOAMI=echo \"whoami\"",

    ]
    inline = [
      "mkdir .ssh",
      "touch .ssh/authorized_keys",
      "echo \"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK0lRmgXgBoW0Q1tZCxHSOKRMj7EyKSBLKV7Mo6YwNF8 carsonculler2020@gmail.com\" > .ssh/authorized_keys",
      "echo \"ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key\" >> .ssh/authorized_keys",
      "whoami",
      "hostname -I",
      "sudo apt-get -y update",
      "sudo apt-get full-upgrade -y",
      // "mkdir /mnt/cdrom",
      // "mount /dev/cdrom /mnt/cdrom",
      // "sudo rpm -ivh /mnt/cdrom/VMwareTools-version.rpm",
      // "/usr/bin/vmware-config-tools.pl",
      // "umount /mnt/cdrom"
      "sudo apt-get install -y open-vm-tools"
    ]
  }
  "post-processors": [
    [
      {
        "type": "vagrant",
        "keep_input_artifact": true
      },
      {
        "type": "vagrant",
        "keep_input_artifact": true,
        "provider_override": "vmware"
      }
    ]
  ]
}