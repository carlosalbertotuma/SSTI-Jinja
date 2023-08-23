#!/bin/bash

# Verifica se foi fornecido um arquivo como argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 <arquivo>"
    exit 1
fi

# Lê o arquivo, elimina 'class' e enumera por linha a partir do 0
grep -o "'[^']*'" "$1" | tr -d "'" | awk '{print NR-1, ".", $0}'
