# Git
abbr -a gst git status
abbr -a gpl git pull
abbr -a gco git checkout
abbr -a gci git commit
abbr -a ga git add
abbr -a gaa git add . -A
abbr -a gd git diff
abbr -a grc git rebase --continue
abbr -a gp git push
abbr -a gsh git stash
abbr -a gf git fetch
abbr -a gl git log
abbr -a glt git log --oneline --graph --decorate --all

# Venv
abbr -a -g vactivate source venv/bin/activate.fish

# Copy & paste 
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

# Files
alias open=xdg-open

# Sum
alias sum='python -c "import sys; print(sum(float(l) for l in sys.stdin))"'

# Fish
set fish_greeting
