variable project {
  #  description = "Project ID"
  description = "engaged-oarlock-262618"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable zone_conn {
  description = "zone connection"
  default     = "europe-west1-b"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable conn_pk {
  description = "connection private key"
#  default     = "/Users/irina/.ssh/id_rsa"
  default     = "/home/kabanchik228/.ssh/id_rsa"
}

#variable ip {
#  description = "ip"
#  default     = "10.132.15.218"
#}
