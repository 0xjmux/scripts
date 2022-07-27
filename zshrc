# my zshrc config, prob not up to date



# Load pyenv automatically by appending
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"

# turns off venv prompt when its default
#export VNRTUAL_ENV_DISABLE_PROMPT=1

export TERM=xterm-256color

alias openwiki='vim ~/vimwiki/index.md'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# start WSL vpnkit, fixes VPN connection issues with WSL2
#wsl.exe -d wsl-vpnkit service wsl-vpnkit start

