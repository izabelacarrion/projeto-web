module "webserver" {
  source        = "./modules"
  nome_ec2      = "SRVWEB01"
  meubloco_cidr = "192.168.0.0/16"
}