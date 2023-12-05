default:
	@cat makefile

.PHONY: env
env:
	python3 -m venv env
	. env/bin/activate; pip install --upgrade pip; pip install -r requirements.txt


.PHONY: init
init:
	. env/bin/activate; dbt init ds5111_db_design_dbt_snow


.PHONY: seed
seed:
	cp sample_seed/ ds5111_db_design_dbt_snow/seeds/ -r
	. env/bin/activate; cd ds5111_db_design_dbt_snow; \
		dbt seed

.PHONY: run 
run:
	. env/bin/activate; cd ds5111_db_design_dbt_snow; \
		dbt run 

.PHONY: run_new
run_new:
	cp -r sample_model/ ds5111_db_design_dbt_snow/models/
	. env/bin/activate; cd ds5111_db_design_dbt_snow; \
		dbt run 

.PHONY: build 
build:
	. env/bin/activate; cd ds5111_db_design_dbt_snow; \
		dbt build 

.PHONY: test 
test:
	. env/bin/activate; cd ds5111_db_design_dbt_snow; \
		dbt test

.PHONY: debug 
debug:
	. env/bin/activate; cd ds5111_db_design_dbt_snow; \
		dbt debug

.PHONY: clean
clean:
	rm -rf ds5111_db_design_dbt_snow
