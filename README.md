Hi, Hey, Yo, Ohayo, Salute, 

# Table of Contents
1. [Standard workflow](https://github.com/blazejdobek/Hi_git/blob/master/README.md#standard-workflow)
2. [Gather information about repository](https://github.com/blazejdobek/Hi_git/blob/master/README.md#gather-information-about-repository)
3. [Git stash](https://github.com/blazejdobek/Hi_git/blob/master/README.md#git-stash)
4. [Modify commits](https://github.com/blazejdobek/Hi_git/blob/master/README.md#modify-commits)
5. [Undoing changes that aren't on staged area](https://github.com/blazejdobek/Hi_git/blob/master/README.md#undoing-changes-that-arent-on-staged-area)
6. [You realised that you make changes // comiits to wrong branch](https://github.com/blazejdobek/Hi_git/blob/master/README.md#you-realised-that-you-make-changes--comiits-to-wrong-branch)
7. [You need to change git history, but other people already download those changes](https://github.com/blazejdobek/Hi_git/blob/master/README.md#you-need-to-change-git-history-but-other-people-already-download-those-changes)
8. ["Those changes you delete with git reset --hard -> we need them and we need them NOW!"](https://github.com/blazejdobek/Hi_git/blob/master/README.md#those-changes-you-delete-with-git-reset---hard---we-need-them-and-we-need-them-now)
9. [Other](https://github.com/blazejdobek/Hi_git/blob/master/README.md#other)
10) [More materials](https://github.com/blazejdobek/Hi_git#more-materials)
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
18) `git push origin --delete <branch_name>`

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

### "Those changes you delete with git reset --hard -> we need them and we need them NOW!"
* `git reflog` # track garbages for 30 days (or so, not sure here :)) --> show commits in order you last referenced them
* `git checkout <hash>` # bring pointed commit back - you are in detached HEAD state, not on some branch -- all things from here will be eventually deleted permanently
* `git branch <some_cool_name>` # create new branch with copy of recovered commit(s)
* `git checkout <some_cool_name>` # ensure that you don't meesed up this shit!
* ... and don't forget to praise genious who came with this feature

------------------------------------------------------------------------------------

### Other
* `git add .` // `git add <some_location>` // `git add -A` # -A add all files from entire files tree, even from up-directories. In contrast - . don't add files from up-directories.
* `git add -u` // `git add -u <some_location>` # update, don't add any new files

------------------------------------------------------------------------------------

### More materials
* [pull-request-tutorial-for-students](https://michalczukm.github.io/pull-request-tutorial-for-students/)
* [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/)
* [Complete guide to open source](https://www.youtube.com/watch?v=yzeVMecydCE&list=WL&index=2)
* [17 ways to undo mistakes with git](https://www.youtube.com/watch?v=lX9hsdsAeTk&list=WL&index=3)
* [CI/CD](https://www.youtube.com/playlist?list=PLOLrQ9Pn6caz3miP7Y-y9q6AyEeGcXRFq), [docker --> django, celery, postgreSQL, reddis, react](https://www.youtube.com/watch?v=W5Ov0H7E_o4&list=PLOLrQ9Pn6cazCfL7v4CdaykNoWMQymM_C)
* docker --> [1](https://www.youtube.com/watch?v=0Rq1aw8ppMk&list=WL&index=2), [2](https://www.youtube.com/watch?v=FCk5ylLjnxw&list=WL&index=3), [3](https://www.youtube.com/watch?v=o6o5N4S5k84&list=WL&index=4). [4](https://www.youtube.com/watch?v=H3N3-S7s8IY&list=WL&index=5), [5](https://www.youtube.com/watch?v=wZbPmb4soTI&list=WL&index=6), [6](https://www.youtube.com/watch?v=eJrR1X38pk4&list=WL&index=7), [7](https://www.youtube.com/watch?v=oBQxFn1CDno&list=WL&index=8), [8](https://www.youtube.com/watch?v=Oy71OgKZbOQ&list=WL&index=9)


