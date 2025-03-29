module "vpc" {
    source = "./modules/vpc"
    project_name = var.project_name
}
module "loadbalancer" {
    source = "./modules/loadbalancer"
    vpc_id = module.vpc.vpc_id
    public_us_west_1b = module.vpc.public_us_west_1b
    public_us_west_1c = module.vpc.public_us_west_1c
}