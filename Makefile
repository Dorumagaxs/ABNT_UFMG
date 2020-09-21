#	Um template LaTeX para geração de trabalhos acadêmicos no padrão ABNT exigido pela UFMG
#	Copyright (C) 2019  Gabriel Santos de Mello
#	
#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#	
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#	
#	You should have received a copy of the GNU General Public License
#	along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#	Contact: gabrielsdmello@gmail.com

all: build view

bin/main.pdf: main.tex bibliografia.bib variaveis.tex pretextual/* postextual/* textual/* textual/capitulos/*
build: bin/main.pdf
	if [ ! -d bin/ ]; then mkdir bin/; fi
	xelatex --output-directory=bin/ main.tex
	xelatex --output-directory=bin/ main.tex
	biber -input-directory=bin/ -output-directory=bin/ main
	xelatex --output-directory=bin/ main.tex

view: build
	zathura bin/main.pdf &

export: build
	cp bin/main.pdf document.pdf

clean:
	if [ -d bin/ ]; then rm -r bin/; fi
	if [ -f document.pdf ]; then rm document.pdf; fi
