# ensure environment is loaded
export PATH="$HOME/.cargo/bin:$HOME/.rbenv/bin:$HOME/.local/bin:$PATH"
source ~/.bashrc

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# rbenv autoloading
if [[ -e $(which rbenv 2>/dev/null) ]]; then
    eval "$(rbenv init -)"
fi
