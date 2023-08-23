#!/bin/bash

# Use o grep para encontrar padrões entre colchetes e remova aspas e colchetes
pattern="\[([^\]]+)\]"
matches=$(grep -Po "$pattern" $1 | sed 's/\[//;s/\]//;s/'\''//g')

# Use o sed para substituir as vírgulas por quebras de linha
formatted_matches=$(echo "$matches" | sed 's/,/\n/g')

# Ordenar os resultados e enumerá-los
sorted_and_numbered=$(echo "$formatted_matches" | sort | awk '{print NR".", $0}')

echo "$sorted_and_numbered"
