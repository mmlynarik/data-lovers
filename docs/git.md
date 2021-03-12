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