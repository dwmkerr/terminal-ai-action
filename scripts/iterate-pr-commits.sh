#!/usr/bin/env bash

# Bin it if we have any errors.
set -e
set -o pipefail

# Debug params.
echo "Params: $*"

# Note that in a GitHub action you can get the base ref with:
#   ${{ github.event.pull_request.base.ref }}
# If we are not provided with a base, assume main.
base_ref="${1:main}"
current_ref=${2?error: a current ref must be specified, e.g \$GITHUB_SHA}
echo "Comparing base: ${base_ref} to ${current_ref}"

# We're detached, get the base and current branches.
git fetch --quiet origin "${base_ref}" "${current_ref}"

# Get the list of commits between main and the current branch
commits=$(git log "${base_ref}..${current_ref}" --pretty=format:"%H")

# Loop through each commit
while IFS= read -r commit; do
  echo "Commit: $commit"
  git log -1 "$commit"  # Show the diff for the commit
  git diff "$commit^" "$commit"  # Show the diff for the commit
  echo
done <<< "$commits"
