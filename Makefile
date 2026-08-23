.PHONY: test build scan plan apply clean

test:
	PYTHONPATH=docker pytest tests/ -v

build:
	docker build -t ghcr.io/mahendarsura/aws-production-devsecops-dr:latest docker/

scan:
	trivy fs --severity HIGH,CRITICAL .
	checkov -d terraform/

plan:
	cd terraform && terraform init && terraform plan

apply:
	cd terraform && terraform apply -auto-approve

clean:
	find . -type d -name __pycache__ -exec rm -rf {} +
