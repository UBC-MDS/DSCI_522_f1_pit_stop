# f1 pit stop time 
# author: Flora Ouedraogo
# date: 2021-12-02


all: result/barplot.png result/propbarplot.png doc/pit_time_stop_report.md

# This script is for downloading data
data/: src/download_data.py
	python src/download_data.py --out_type=pit_stops --url=shttps://www.kaggle.com/rohanrao/formula-1-world-championship-1950-2020?select=pit_stops.csv


# The following is the script for exploratory data analysis - visualizing the data
result/barplot.png result.png: src/eda_script.R data/pit_stops.csv
	Rscript src/eda_script.R--train=data/pit_stops.csv --out_dir=results


# render report
doc/pit_stops_report.md: doc/formula_1.Rmd 
	Rscript -e "rmarkdown::render('doc/formula_1.Rmd')"

clean: 
	rm -rf data
	rm -rf results
	rm -rf doc/formula_1.Rmd 
			