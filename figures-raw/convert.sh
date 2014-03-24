#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 filename.svg"
  exit 1;
fi

NAME=$(echo "$1"|sed "s/\.svg$//") 

inkscape -D -z --file="$NAME.svg" --export-pdf=../fig/"$NAME.pdf" --export-latex

pushd ../fig/ >/dev/null


sed "s#.put(0,0){.includegraphics\[width=.unitlength\]{$NAME.pdf}}#\\\put(0,0){\\\includegraphics[width=\\\unitlength]{fig/$NAME.pdf}}%#g" \
$NAME.pdf_tex > tmp
mv tmp "$NAME.pdf_tex"

#diff "$NAME.pdf_tex" tmp


popd >/dev/null