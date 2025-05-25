#!/bin/bash
expression=$1
precision=$2

if [ "$precision" == "" ]; then
    precision=1;
fi;

# Perform arithmetic operation using awk
result=$(awk "BEGIN {printf \"%.${precision}f\n\", $expression}" | sed 's/\.0$//')

# Print the result
echo "$result"
