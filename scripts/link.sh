#!/bin/zsh
set -euo pipefail

file_links="$(pwd)/links/file.tsv"
dir_links="$(pwd)/links/dir.tsv"

# Loop through each line in file_links.txt
while IFS= read -r file; do
  from="$(pwd)/$file"
  to="$HOME/$file"

  ln -sf $from $to 
  echo "Created file link: $from -> $to"
done < "$file_links"

