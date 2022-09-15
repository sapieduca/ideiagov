.PHONY: jupyter
jupyter:
	docker-compose up --force-recreate --remove-orphans --build notebook


.PHONY: datasets
datasets:
	bash get_all.sh
