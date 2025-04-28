#!/bin/zsh
set -euo pipefail

cwd="$(pwd)"
file_links="$(pwd)/links/file.tsv"
dir_links="$(pwd)/links/dir.tsv"

# Function to safely create a symlink
create_link() {
    local from="$1"
    local to="$2"

    if [ -L "$to" ] && [ "$(readlink "$to")" = "$from" ]; then
        echo "Already linked: $to -> $from, skipping."
    else
        mkdir -p "$(dirname "$to")" # Ensure destination folder exists
        ln -sf "$from" "$to"
        echo "Created link: $from -> $to"
    fi
}

# Loop through each line in file.tsv
while IFS= read -r file; do
    from="$cwd/$file"
    to="$HOME/$file"

    create_link "$from" "$to"
done <"$file_links"

# Loop through each line in dir.tsv
while IFS=' ' read -r name dest; do
    from="$cwd/$name"
    to="$HOME/$dest"

    create_link "$from" "$to"
done <"$dir_links"
