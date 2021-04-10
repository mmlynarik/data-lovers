# Undos
To remove locally added changes which were not commited:

Discard local changes to a file permanently: `git checkout -- <filename>`

Discard local changes to all files permanently: `git reset --hard`

# Switching to other branches without commiting unfinished work
> For stash and pop stash functionality, I'd recommend using an IDE if possible as it is much easier

Discard all local changes, but save them for possible re-use later: `git stash`

To redo previously stashed changes and remove them from stashed list: `git stash pop`

# Getting back in time
If you wish to switch to a specific commit:

`git checkout <commit_hash>` to get to a specific commit

`git checkout <my_branch>` to get to the latest version of the branch


Git pull doesn't pull remote branches or doesn't communicate with remote on any other branch than master.

Check your git config: `git config --get remote.origin.fetch`

If it is set only to master then it is the reason why you can't pull any other remote branches.

Fix with: `git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"`

# Useful commands

`git branch` to check the name of the current branch

`git commit --amend` to edit the most recent commit message