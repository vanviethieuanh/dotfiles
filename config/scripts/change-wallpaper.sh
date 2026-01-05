#!/bin/bash

# Overwrite the file first
> ~/Downloads/args.txt

# Loop over all arguments
for arg in "$@"; do
    echo "$arg" >> ~/Downloads/args.txt
done
