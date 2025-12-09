alias pushhead='git pushhead'
alias pushheadf='git pushheadf'
alias pullhead='git pullhead'
alias synchead='git pullhead && git pushhead'
alias trgbd="git commit --amend --no-edit --no-verify && pushheadf --no-verify"

cfb() {
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Not inside a Git repository. Aborting..."
    return
  fi

  # Get the current branch name
  current_branch=$(git branch --show-current)

  # If the current branch is not "master", prompt for confirmation
  if [ "$current_branch" != "master" ]; then
    read "confirm?You are on branch '$current_branch'. Continue? (y/n): "
    if [[ "$confirm" != "y" ]]; then
      echo "Aborting..."
      return
    fi
  fi

  # Get the base name from the argument
  base_branch="feature/$1"

  # Start with the base name
  new_branch="$base_branch"
  counter=1

  # Loop until a non-existent branch name is found
  while git show-ref --verify --quiet "refs/heads/$new_branch"; do
    echo "$new_branch already exists"
    new_branch="${base_branch}-v$counter"
    ((counter++))
  done

  echo "Creating branch: $new_branch"
  git checkout -b "$new_branch"
}
