.PHONY: jupyter
jupyter:
	docker-compose up --force-recreate --remove-orphans --build notebook
