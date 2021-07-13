Hi, Hey, Yo, Ohayo, Salute, 

# Table of Contents
1. [Standard workflow](https://github.com/blazejdobek/Hi_git/blob/master/README.md#standard-workflow)
2. [Gather information about repository](https://github.com/blazejdobek/Hi_git/blob/master/README.md#gather-information-about-repository)
3. [Git stash](https://github.com/blazejdobek/Hi_git/blob/master/README.md#git-stash)
4. [Modify commits](https://github.com/blazejdobek/Hi_git/blob/master/README.md#modify-commits)
5. [Undoing changes that aren't on staged area](https://github.com/blazejdobek/Hi_git/blob/master/README.md#undoing-changes-that-arent-on-staged-area)
6. [You realised that you make changes // comiits to wrong branch](https://github.com/blazejdobek/Hi_git/blob/master/README.md#you-realised-that-you-make-changes--comiits-to-wrong-branch)
7. [You need to change git history, but other people already download those changes](https://github.com/blazejdobek/Hi_git/blob/master/README.md#you-need-to-change-git-history-but-other-people-already-download-those-changes)
8. [You commit, but realise that there are mistakes, which you fix via another commit. After quick thinking -- you make git history looks like shit!](https://github.com/blazejdobek/Hi_git/blob/master/README.md#you-need-to-change-git-history-but-other-people-already-download-those-changes)
9. ["Those changes you delete with git reset --hard -> we need them and we need them NOW!"](https://github.com/blazejdobek/Hi_git/blob/master/README.md#those-changes-you-delete-with-git-reset---hard---we-need-them-and-we-need-them-now)
10. [Git branches](https://github.com/blazejdobek/Hi_git/blob/master/README.md#git-branches)
11. [Other](https://github.com/blazejdobek/Hi_git/blob/master/README.md#other)
12. [More materials](https://github.com/blazejdobek/Hi_git#more-materials)
------------------------------------------------------------------------------------

### Standard workflow
1) `git clone <url> <where to clone>`
2) `git branch <branch_name>` or `git checkout -b <branch_name>` (step 2 and 3)
3) `git checkout <branch_name>` 
4) > Some work happen here'
5) `git diff`
6) `git add <file> // git add .`
7) `git commit -m "SOME TEXT - USE VERBS"`
8) `git status`
9) `git push --set-upstream origin <branch_name>` # first push on new branch - it tells git to associate local <branch_name> with remote branch with same name
10) `git pull` # every time but first
11) `git push` # evry time but first
12) `git checkout <master>` # switch branch
13) `git pull origin <master>` # make sure to work on newest version on codebase
14) `git merge <branch_name>` # MERGE TIME!
15) `git push origin <master>`
16) `git branch --merged` # confirme that we can delete our branch
17) `git branch -d <branch_name>` # delete branch only locally`
18) `git push origin --delete <branch_name>` # delete remote branch 

------------------------------------------------------------------------------------

### Gather information about repository
* `git remote -v` # from where code is fetch and to where code is push
* `git branch -a` # list of all branches (locally and remotely)
* `git branch --merged` # branches merged to current branch so far

------------------------------------------------------------------------------------

### Git stash
--> tip: stash are shared by all branches
* `git stash save "Pro memoria"`
* `git stash list`
* `git stash apply <stash_id>`
* `git stash pop` # apply first stash and delete it -- stash list working just like stack
* `git stash drop <stash_id>` # just delete given stash
* `git stash clear` # beware! --> delete all stash

------------------------------------------------------------------------------------

### Undoing changes that aren't on staged area
`git checkout <file>` # undoing changes in file, which is not on staged area

------------------------------------------------------------------------------------

### Modify commits
* `git commit --amend -m "Correct message"` # changing message in last commit. This will change unique hash assigned to ech commit --> change git history. You want to change history only when you are the only one who have acces to those changes. 
* `git commit --amend` # adding file(s) on your current staged area to last commit. This will change git history. Btw you can also change message from here.
* `git log --stat` # to ensure that you haven't screwed up things

------------------------------------------------------------------------------------

### You realised that you make changes // comiits to wrong branch
* `git log` # to copy unique hash of your commit -> you don't have to copy all hash :)
* `git checkout <branch_you_should_have_been>`
* `git cherry-pick <hash>` # create commit based on commit with hash you given (but don't delete that unwanted one)
* `git checkout <branch_you_accidently_littered>`
* here we will use the power of `git reset` - pick only one. Choose wisely!
	* `git reset --soft <hash>` # revert changes to staged area
	* `git reset <hash> # git reset --mixed <hash>` ==> default option; revert changes to working directory (instead of staged area)
	* `git reset --hard <hash>` # revert all tracked files to state they were, but leave untracked files alone
	* `git clean -df` # f for files, d for directors --> remove all untracked dirs and files


------------------------------------------------------------------------------------

### You need to change git history, but other people already download those changes
* Solution: make a commit which revert your changes => `git revert <hash>` # this will add new commit with message "Revert 'commit message with given id (hash)'"

------------------------------------------------------------------------------------

------------------------------------------------------------------------------------

### You commit, but realise that there are mistakes, which you fix via another commit. After quick thinking -- if you just commit it will make git history looks like shit!
* `git add <file_name>` + `git commit --fixup <commit_id_of_incomplete_commit>`
* `git rebase -i <how_far_you_need_go_back> --autosquash` # fun fact -> you don't need to do anything more - just :wq from this text editor ASAP!

------------------------------------------------------------------------------------

### "Those changes you delete with git reset --hard -> we need them and we need them NOW!"
* `git reflog` # track garbages for 30 days (or so, not sure here :)) --> show commits in order you last referenced them
* `git checkout <hash>` # bring pointed commit back - you are in detached HEAD state, not on some branch -- all things from here will be eventually deleted permanently
* `git branch <some_cool_name>` # create new branch with copy of recovered commit(s)
* `git checkout <some_cool_name>` # ensure that you don't meesed up this shit!
* ... and don't forget to praise genious who came with this feature

------------------------------------------------------------------------------------

### Git branches
* `git branch new-branch <commit_id>` # create ne branch based on given commit, if nothing specified based on current HEAD
* `git checkout <branch_name>` // `git switch <branch_name>`
* `git branch -m <new_branch_name>` // `git branch -m <old_name> <new_name>` # renaming branch
	* `git push orgin --delete <old_name_branch>`
	* `git push -u orgin <new_name_branch>` # in order to rename remote branch you need to delete old_name_branch and publish new_name_branch
	* `git push -u orgin <branch>` # publish new branch on remote repo and tracked it with current branch 
* `git branch --track <local_name_branch> orgin/<remote_name_branch>` # establish connection between two branches (local and remote)
	* `git checkout --track orgin/<remote_branch_name>` #establish connection between current local branch and given remote branch
* `git log <branch_name>..<other_branch_name>` # show commits that are in <other_branch_name>, but not in <branch_name>
* `git checkout <branch_into_you_want_to_make_rebase>` + `git rebase <branch_you_want_to_add>` # git rebase

<img src="https://i.ibb.co/Qv4PyS3/Screenshot-2021-07-13-at-21-30-06.png" alt="Git merge" border="0" /> 	(Git merge)
<img src="https://i.ibb.co/12BcptS/Screenshot-2021-07-13-at-21-30-18.png" alt="Git rebase" border="0" />	(Git rebase)

------------------------------------------------------------------------------------

### Other
* `git add .` // `git add <some_location>` // `git add -A` # -A add all files from entire files tree, even from up-directories. In contrast - . don't add files from up-directories.
* `git add -u` // `git add -u <some_location>` # update, don't add any new files

------------------------------------------------------------------------------------

### More materials
* [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/)
* git rebase --interactive // git squash // merge --squash
