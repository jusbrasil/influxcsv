html:
	cat README.md|ronn -5 --style dark --organization='http://kaeding.name' --pipe > ./static/influxcsv.1.html

run: html
	foreman start
