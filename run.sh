#!/bin/bash

echo "Run handin template"

echo "Creating the plotting directory if it does not exist"
if [ ! -d "plots" ]; then
  echo "Directory does not exist create it!"
  mkdir plots
fi

python3 sine.py

python3 helloworld.py > helloworld.txt

python3 cos.py

echo "Generating the pdf"

pdflatex template.tex
bibtex template.aux
pdflatex template.tex
pdflatex template.tex


