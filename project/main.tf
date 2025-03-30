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
module "frontend" {
    source = "./modules/frontend"
    vpc_id = module.vpc.vpc_id
    private_us_west_1b = module.vpc.private_us_west_1b
    private_us_west_1c = module.vpc.private_us_west_1c
}
module "backend" {
    source = "./modules/backend"
    vpc_id = module.vpc.vpc_id
    private_us_west_1b = module.vpc.private_us_west_1b
    private_us_west_1c = module.vpc.private_us_west_1c
}