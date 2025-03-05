# Note that in a GitHub action you can get the base ref with:
# ${{ github.event.pull_request.base.ref }}
base_ref="main"
echo "Base Ref: ${base_ref}"

# Fetch the base so that we know its commits.
git fetch origin ${base_ref}

# Get the list of commits between main and the current branch
commits=$(git log main..HEAD --pretty=format:"%H")

# Loop through each commit
while IFS= read -r commit; do
  echo "Commit: $commit"
  # git diff "$commit^" "$commit"  # Show the diff for the commit
  echo
done <<< "$commits"
