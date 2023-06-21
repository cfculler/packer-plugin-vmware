# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

cdrom_adapter_type   = "sata"
data_directory       = "data/debian"
disk_adapter_type    = "sata"
network_adapter_type = "e1000e"
iso_url              = "https://cdimage.debian.org/cdimage/archive/11.7.0/amd64/iso-cd/debian-11.7.0-amd64-netinst.iso"
iso_checksum         = "b33775a9ab6eae784b6da9f31be48be3"
guest_os_type        = "debian-64"
hardware_version     = 20
boot_command         = ["<wait><esc><wait>auto preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg netcfg/get_hostname={{ .Name }}<enter>"]
vm_name              = "debian_amd64_v2"
vmx_data = {
  "cpuid.coresPerSocket"    = "2"
  "ethernet0.pciSlotNumber" = "32"
  "svga.autodetect"         = true
  "usb_xhci.present"        = true
}


