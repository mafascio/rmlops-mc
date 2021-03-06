library(azuremlsdk)
library(magrittr)
library(optparse)

options <- list(
  make_option("--tenant_id", default=""),
  make_option("--service_principal_id", default=""),
  make_option("--service_principal_password", default=""),
  make_option("--aml_workspace", default=""),
  make_option("--aml_subscription_id", default=""),
  make_option("--aml_resource_group", default=""),
  make_option("--aml_attrition_model", default="")
)

# Parse option from command line
opt_parser <- OptionParser(option_list = options)
opt <- parse_args(opt_parser)

# Create a Service Principal Credential to connect to the Azure ML workspace
svc_pr <- service_principal_authentication(opt$tenant_id, opt$service_principal_id,
  opt$service_principal_password, cloud = "AzureCloud")

# Get AML Workspace
ws <- get_workspace(opt$aml_workspace,
                    opt$aml_subscription_id,
                    opt$aml_resource_group,
                    auth = svc_pr)

# Get a registered model
model <- get_model(ws, 
                    name = opt$aml_attrition_model)
# Create environment
#r_env <- r_environment(name = "basic_env")

#pkg1 <- cran_package("caret")
#pkg2 <- cran_package("magrittr")
#pkg3 <- cran_package("e1071")
#pkg4 <- cran_package("optparse")
#pkg5 <- cran_package("kernlab")


#r_env <- r_environment(name = "r_env",
#                     cran_packages = list(pkg1, pkg2, pkg3, pkg4, pkg5))



r_env <- r_environment(name='r_attr_env', version = '1', 
              custom_docker_image = 'amlrpythonmc71c62d90.azurecr.io/mlopsamlsdkforr:latest')#,
                 #image_registry_details = NULL
# Create inference config
inference_config <- inference_config(
  entry_script = "./code/attrition_model/attrition_predict.R",
  source_directory = ".",
  environment = r_env)

#Deploy to ACI
aci_config <- aci_webservice_deployment_config(cpu_cores = 1, memory_gb = 0.5)

aci_service <- deploy_model(ws, 
                            gsub("_", replacement = "", x = gsub(":", replacement = "", x = model$id)), 
                            list(model), 
                            inference_config, 
                            aci_config)

wait_for_deployment(aci_service, show_output = TRUE)