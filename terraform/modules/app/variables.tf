variable enviroment {}   

variable zone {
  description = "Zone"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable private_key_path {
  description = "Path to the appuser private key used for ssh access"
}

variable "db_internal_ip" {
  description = "MongoDB internal IP"
  default = "127.0.0.1"
}
