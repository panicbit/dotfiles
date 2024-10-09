export alias a = ^git add
# alias aa = ^git add --update
export alias add = ^git add
# alias am = ^git am
export alias amend = ^git commit --verbose --amend
# alias annotate = ^git annotate
export alias ap = ^git add --patch
# alias apply = ^git apply
# alias archive = ^git archive
export alias b = ^git branch
# alias bisect = ^git bisect
# alias blame = ^git blame
export alias branch = ^git branch
export alias c = ^git checkout
# alias ca = ^git commit --verbose --all
# alias cat-file = ^git cat-file
export alias checkout = ^git checkout
# alias cherry = ^git cherry
# alias cherry-pick = ^git cherry-pick
export alias ci = ^git commit --verbose
export alias clean = ^git clean
# alias clone = ^git clone
# alias commit = ^git commit
# alias config = ^git config
export alias d = ^git diff
# alias describe = ^git describe
alias diff = ^git diff
# alias difftool = ^git difftool
# alias ds = ^git diff --stat
export alias f = ^git fetch
# alias fetch = ^git fetch
# alias format-patch = ^git format-patch
# alias fsck = ^git fsck
export alias g = ^git
# alias gc = ^git gc
# alias gui = ^git gui
# alias hard = ^git reset --hard
# alias hash-object = ^git hash-object
# #alias init = ^git init
# alias instaweb = ^git instaweb
# alias k = ^git cherry-pick
# alias l = ^git log --pretty = oneline --abbrev-commit
# #alias log = ^git log
# alias lost-found = ^git lost-found
# alias ls-files = ^git ls-files
# alias ls-remote = ^git ls-remote
# alias ls-tree = ^git ls-tree
export alias m = ^git merge
# alias merge-base = ^git merge-base
# alias mergetool = ^git mergetool
# # alias mv = ^git mv
export alias n = ^git commit --verbose --amend
# alias p = ^git diff --cached
export alias p = ^git pull
# alias patch-id = ^git patch-id
# alias peek = ^git log -p --max-count = 1
# alias peek-remote = ^git peek-remote
# alias pm = ^git pull
export alias pop = ^git reset --soft HEAD^
# alias pr = ^git pull --rebase
# alias prune = ^git prune
export alias pull = ^git pull
export alias push = ^git push
# alias quiltimport = ^git quiltimport
export alias r = ^git remote
export alias re = ^git rebase --interactive
export alias rebase = ^git rebase
export alias reflog = ^git reflog
export alias remote = ^git remote
# alias repack = ^git repack
# alias repo-config = ^git repo-config
# alias request-pull = ^git request-pull
export alias res = ^git reset
# alias rev-list = ^git rev-list
# alias rev-parse = ^git rev-parse
# alias revert = ^git revert
# alias rem = ^git rm
# alias del = ^git rm
export alias s = git status --short # ^git commit --dry-run --short
# alias scrap = ^git checkout HEAD
# alias send-email = ^git send-email
# alias send-pack = ^git send-pack
# alias shortlog = ^git shortlog
# alias show = ^git show
# alias show-branch = ^git show-branch
# alias soft = ^git reset --soft
# alias stage = ^git add
export alias stash = ^git stash
export alias status = ^git status
# alias stripspace = ^git stripspace
# alias submodule = ^git submodule
# #alias svn = ^git svn
# alias symbolic-ref = ^git symbolic-ref
# alias t = ^git diff --cached
export alias tag = ^git tag
# alias tar-tree = ^git tar-tree
# alias unstage = ^git reset HEAD
# alias var = ^git var
# alias whatchanged = ^git whatchanged

def fixable-commits [] {
      git log $"(git merge-base main HEAD).." --format="format:%h %s"
    | lines
    | parse '{shorthash} {subject}'
    | where not (subject starts-with 'fixup! ')
    | each {{
        value: $in.shorthash
        description: ($in.subject)
    }}
}

export def fix [
    commit: string@fixable-commits
] {
    git commit --fixup $commit
}
