# Maintain linear git history

Assumption: default branch is `master`, branch name is `feature-branch`

## Using rebase

* If `feature-branch` include new commits from `master`

```sh
# Change to feature branch
git switch feature-branch

# Create a separate branch from feature-branch to avoid losing its changes
git switch -c temp-branch

# Change to master and pull latest changes
git switch master && git pull

# Change to feature-branch and reset it to latest master
git switch feature-branch
git reset --hard master

# Check relevant commits from temp-branch and cherry-pick them in feature branch
git log temp-branch # Take a not of relevant commit shas
git cherry-pick ... # Do this for each commit in chronological order

# Force push the feature-branch to github
git push -f origin feature-branch

# Delete the temp-branch
git branch -D temp-branch
```

* If `feature-branch` does not include new commits from `master`

```sh
# Change to master and pull latest changes
git switch master && git pull

# Change to feature-branch and rebase it on latest master
git switch feature-branch
git rebase master

# Fix any conflicts manually if there are any and do `git add ...` for any such files where you had to fix conflicts 
git rebase --continue # Optional step that you need to each time the rebase gets interrupted by a merge conflict

# Force push the updated feature-branch to github
git push -f origin feature-branch
```
