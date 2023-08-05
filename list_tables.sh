#!/usr/bin/bash

fun_list__tables() {

    if [ -n "$(ls -A $pwd " ]; then
        echo "Existing Tables"
        ls ./Data/*
    else
        echo You Do not have any Tables yet
    fi
}


##!/bin/bash

#DIR="$(pwd)/Databases/$currDB/Data"

#if [ -d "$DIR" ] && [ "$(ls -A $DIR)" ]; then
  # echo "Available tables"
  #ls $DIR
#else 
    #echo "No tables to show"
#fi
