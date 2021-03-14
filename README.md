### Standard workflow
1) `git clone <url> <where to clone>`
2) `git branch <branch_name>`
3) `git checkout <branch_name>`
4) > Some work happen here'
5) `git diff`
6) `git add <file> // git add .`
7) `git commit -m "SOME TEXT - USE VERBS"`
8) `git status`
9) `git push -u orgin <branch_name>` # first push on new branch - it tells git to associate local <branch_name> with remote branch with same name
10) `git pull` # every time but first
11) `git push` # evry time but first
12) `git checkout master` # switch branch
13) `git pull orgin master` # make sure to work on newest version on codebase
14) `git merge <branch_name>` # MERGE TIME!
15) `git push origin master`
16) `git branch --merged` # confirme that we can delete our branch
17) `git branch -d <branch_name>` # delete branch only locally`
18) `git push origin --delete <branch_name>`

------------------------------------------------------------------------------------

# Gather information about repository
git remote -v # from where code is fetch and to where code is push
git branch -a # list of all branches (locally and remotely)
git branch --merged # branches merged to current branch so far

# Other
git add . // git add <some_location> // git add -A # -A add all files from entire 
# files tree, even from up-directories. In contrast - . don't add files from up-directories.
git add -u // git add -u <some_location> # update, don't add any new files

------------------------------------------------------------------------------------

# 1) Undoing changes that aren't on staged area
git checkout <file> # undoing changes in file, which is not on staged area

# 2) Modify commits
git commit --amend -m "Correct message" # changing message in last commit. This will
# change unique hash assigned to ech commit --> change git history. You want to 
#change history only when you are the only one who have acces to those changes. 
git commit --amend # adding file(s) on your current staged area to last commit. This will
# change git history. Btw you can also change message from here.
git log --stat # to ensure that you haven't screwed up things

# 3) You realised that you make changes // comiits to wrong branch
git log # to copy unique hash of your commit -> you don't have to copy all hash :)
git checkout <branch_you_should_have_been>
git cherry-pick <hash> # create commit based on commit with hash you given (but don't
# delete that unwanted one)
git checkout <branch_you_accidently_littered> 
<here we will uses the power of git reset - pick only one. Choose wisely!>
	git reset --soft <hash> # revert changes to staged area
	git reset <hash> # git reset --mixed <hash> ==> default option; revert changes to
	# working directory (instead of staged area)
	git reset --hard <hash> # revert all tracked files to state they were, but leave 
	# untracked files alone
	git clean -df # f for files, d for directors --> remove all untracked dirs and files

# 4) "Those changes you delete with git reset --hard -> we need them and we need 
# them NOW!"
git reflog # track garbages for 30 days (or so, not sure here :)) --> show commits
# in order you last referenced them
git checkout <hash> # bring pointed commit back - you are in detached HEAD state, not
# on some branch -- all things from here will be eventually deleted permanently
git branch <some_cool_name> # create new branch with copy of recovered commit(s)
git checkout <some_cool_name> # ensure that you don't meesed up this shit!
# And don't forget to praise genious who came with this feature

# 5) You need to change git history, but other people already download those changes.
# Solution: make a commit which revert your changes.
git revert <hash> # this will add new commit with message "Revert 'commit message
# with given id (hash)'"

# Git stash --> tip: stash are shared by all branches
git stash save "Pro memoria"
git stash list
git stash apply <stash_id>
git stash pop # apply first stash and delete it -- stash list working just like stack
git stash drop <stash_id> # just delete given stash
git stash clean # beware! --> delete all stash
