#!/bin/bash

# SCRIPT file_in file_out

# if Maude is not in PATH add it or change the "maude" in commands to the path to the Maude executable
# learn-transformer has to be in the same directory or you can add its path before the name of the file

SOURCE=$(cat "$1")
OUT="${2/\~/$HOME}"

MAUDE_OUT="$(echo -e "red html("$SOURCE") ." | maude theory_transformer.maude -no-banner -no-advise)"
#MAUDE_OUT=${MAUDE_OUT//\`/ } #swap ` to blank spaces
MAUDE_OUT="${MAUDE_OUT##*result String: \"}" #remove prefix
MAUDE_OUT=${MAUDE_OUT%\"*} #remove sufix

printf "$MAUDE_OUT" > "$OUT"
