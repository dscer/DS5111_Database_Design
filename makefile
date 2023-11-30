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
	cp sample_seed/NASA_Facilities.csv ds5111_lab_dbt_snow/seeds/
	. env/bin/activate; cd ds5111_db_design_dbt_snow; \
		dbt seed

.PHONY: run 
run:
	. env/bin/activate; cd ds5111_db_design_dbt_snow; \
		dbt run 

.PHONY: run_new
run_new:
	cp -r sample_model/nasa ds5111_lab_dbt_snow/models/
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

.PHONY: clean
clean:
	rm -rf ds5111_db_design_dbt_snow
