module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = "iac-test"
  s3_tags = {
    IaC = true
  }
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  origin_id          = module.s3.bucket_id
  bucket_domain_name = module.s3.bucket_domain_name
  cdn_price_class    = "PriceClass_200"
  cdn_tags = {
    IaC = true
  }

  depends_on = [
    module.s3
  ]

}