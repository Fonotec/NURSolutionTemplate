#!/bin/bash

echo "Run handin template"

echo "Creating the plotting directory if it does not exist"
if [ ! -d "plots" ]; then
  echo "Directory does not exist create it!"
  mkdir plots
fi

echo "Check if the sine movie exist"
if [ -e sinemovie.mp4 ]; then
  echo "Remove mp4 file"
  rm sinemovie.mp4
fi

echo "Download image for in report..."
if [ ! -e sine.png ]; then
  wget strw.leidenuniv.nl/~nobels/sine.png 
fi

# Script that returns a plot
echo "Run the first script ..."
python3 sine.py

# Script that pipes output to a file
echo "Run the second script ..."
python3 helloworld.py > helloworld.txt

# Script that saves data to a file
echo "Run the third script ..."
python3 cos.py

# Script that generates movie frames
echo "Run the fourth script ..."
python3 sinemovie.py

# code that makes a movie of the movie frames
ffmpeg -framerate 25 -pattern_type glob -i "plots/snap*.png" -s:v 640x480 -c:v libx264 -profile:v high -level 4.0 -crf 10 -tune animation -preset slow -pix_fmt yuv420p -r 25 -threads 0 -f mp4 sinemovie.mp4

echo "Generating the pdf"

pdflatex template.tex
bibtex template.aux
pdflatex template.tex
pdflatex template.tex


