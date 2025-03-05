#!/usr/bin/env bash

# Bin it if we have any errors.
set -e
set -o pipefail

# Note that in a GitHub action you can get the base ref with:
#   ${{ github.event.pull_request.base.ref }}
# If we are not provided with a base, assume main.
base_ref="${1:main}"
current_ref=${2?error: a current ref must be specified, e.g \$GITHUB_SHA}
echo "Comparing base: ${base_ref} to ${current_ref}"

# Diff the base branch to the head of our PR.
git diff "${base_ref}" "${current_ref}"
