ENV_FILE=

.PHONY: jupyter-notebook
jupyter-notebook:
	docker-compose up --force-recreate --remove-orphans --build jupyter-notebook

.PHONY: upload-datasets-s3
upload-datasets-to-s3:
	docker-compose run --rm upload-datasets-to-s3

.PHONY: download-datasets
download-datasets:
	docker-compose run --rm download-datasets
