export PS1="%F{240}%~%f"$'\n'"%F{9}𝝺%f "
export EDITOR=nvim

# Dotfiles setup
alias config='/usr/bin/git --git-dir=$HOME/dev/dotfiles/ --work-tree=$HOME'

alias vimconfig="cd ~/.config/nvim/ && nvim ."
alias zshconfig="nvim ~/.zshrc"
alias alacrittyconfig="nvim ~/.config/alacritty/alacritty.yml"
alias reload="source ~/.zshrc"
alias c="clear"
alias flix="java -jar ~/dev/flix.jar"

# use enter to recompile when any .tex file changes in the current directory
# Note: Must be called from the root containing main.tex. 
# Does not consider removing or adding new files (this required a restart)
alias pdfwatch="find . -type f '(' -name '*.tex' -o -name '*.tx' ')' | entr pdflatex main.tex"

export PATH="/opt/homebrew/opt/llvm/bin:/opt/homebrew/bin:$PATH"

bindkey -s '^o' 'nvim $(fzf)^M'

# search history with up and down keys
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m --preview "exa --tree --level=1 --icons {}") &&
  cd "$dir"
}

# Find and open file
fo() {	
  fzf --preview 'bat {} --theme=gruvbox-dark --color=always' | xargs nvim
}

# 
gbs() {
  git branch -a | grep "$1" | fzf --layout reverse-list --header="Select branch" --preview "echo {} | sed 's/ //g' | xargs git log | bat --color=always --theme=gruvbox-dark -p" | xargs git checkout
}

eval "$(starship init zsh)"

[ -f "/Users/herluf/.ghcup/env" ] && source "/Users/herluf/.ghcup/env" # ghcup-env
