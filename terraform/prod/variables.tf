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
  default     = "~/.ssh/id_rsa.pub"
}
variable count_vms {
  description = "count_vms"
  default     = "1"
}
