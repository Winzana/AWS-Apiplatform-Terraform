.DEFAULT_GOAL := help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

create_env: 
	terraform init
	terraform workspace new dev

terraforms.tfstate.d/prod/dev:
	terraform init
	terraform workspace new dev

init: 
	terraform init
	terraform workspace select dev

apply: init # Apply terraform
	terraform apply -var-file=dev.tfvars -auto-approve

destroy:
	terraform destroy -var-file=dev.tfvars -auto-approve
