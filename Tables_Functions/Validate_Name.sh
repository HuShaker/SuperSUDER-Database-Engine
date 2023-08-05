#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

Validate_Name() {
    echo "$1" | grep -q '^[_[:alpha:]][_[:alpha:][:digit:]]*$' && echo "True" || echo "False"
}

Validate_Name $1