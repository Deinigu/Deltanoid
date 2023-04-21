#!/bin/sh
echo -ne '\033c\033]0;Deltanoid\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Deltanoid.x86_64" "$@"
