variable "vm_name" {

}
variable "admin_username" {

}
variable "admin_password" {
  sensitive = true
}

variable "subnet_id" {

}
variable "rg_name" {

}

variable "numberofVm" {
  type    = number
  default = 1
}
