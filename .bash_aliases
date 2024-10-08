alias pushhead='git pushhead'
alias pushheadf='git pushheadf'
alias pullhead='git pullhead'
alias synchead='git pullhead && git pushhead'

cfb() {
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Not inside a Git repository. Aborting..."
    return
  fi
  # Get the current branch name
  current_branch=$(git branch --show-current)

  # If the current branch is not "master", prompt for confirmation
  if [ "$current_branch" != "master" ]; then
    read -p "You are on branch '$current_branch'. Continue? (y/n): " confirm
    [[ "$confirm" != "y" ]] && echo "Aborting..." && return
  fi

  # Run the `git cfb` command with the first argument
  git cfb "$1"
}
