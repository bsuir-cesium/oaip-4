run-d:
	fpc src/DELPHI.dpr -o"bin/DELPHI.o"
	./bin/DELPHI.o

run-p:
	python src/main.py
