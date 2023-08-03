#!/usr/bin/env bash

files=$(git status -s | grep -E 'A|M' | awk '{print $2}')
files="$files $(git status -s | grep -E 'R' | awk '{print $4}')"
echo $files | xargs rubocop --display-cop-names --extra-details --parallel --force-exclusion
