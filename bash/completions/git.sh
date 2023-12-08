complete -W '$(gbl)' gb # git branch
complete -W '$(gbl)' gc # git checkout
complete -C 'git branch' gfs # git flow start
complete -W 'add rm -v' gr # git remote
complete -W '$(grs)' gra # git remote add 
complete -W '$(grs)' grr # git remote remove
complete -W '$(git tag -l)' tagd # git tag delete
complete -W '$(git tag -l)' taga # git tag add


