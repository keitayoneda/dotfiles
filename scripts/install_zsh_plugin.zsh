#!/usr/bin/env zsh

# 対象のディレクトリが存在してかつgitレポジトリだったら0 を返す関数
is_git_repo() {
    local dir="$1"

    # ディレクトリが存在するか確認
    if [[ ! -d "$dir" ]]; then
        # echo "エラー: ディレクトリ '$dir' が存在しません。"
        return 1
    fi

    # Gitのトップレベルディレクトリ（.gitが存在するディレクトリ）を探す
    if git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        # echo "ディレクトリ '$dir' はGitリポジトリです。"
        return 0
    else
        # echo "ディレクトリ '$dir' はGitリポジトリではありません。"
        return 1
    fi
}

# custom zsh plugin dir
CUSTOM_ZSH_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
# auto-suggestions
if  ! is_git_repo "${CUSTOM_ZSH_DIR}/zsh-autosuggestions"; then
	git clone https://github.com/zsh-users/zsh-autosuggestions ${CUSTOM_ZSH_DIR}/zsh-autosuggestions
fi

# completions
if ! is_git_repo "${CUSTOM_ZSH_DIR}/zsh-completions" ; then
	git clone https://github.com/zsh-users/zsh-completions ${CUSTOM_ZSH_DIR}/zsh-completions
fi

# syntax-highlighting
if ! is_git_repo "${CUSTOM_ZSH_DIR}/zsh-syntax-highlighting"; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${CUSTOM_ZSH_DIR}/zsh-syntax-highlighting
fi

# install fzf
if ! is_git_repo "${HOME}/.fzf"; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

# install direnv
sudo apt install direnv

# pluginに追加
plugins_to_add="direnv zsh-autosuggestions zsh-completions zsh-syntax-highlighting"
current_plugins=$(grep "^plugins=(" "$HOME/.zshrc" | sed 's/^plugins=(//' | sed 's/)//')

if [[ -n "$current_plugins" ]]; then
	plugins="plugins=($current_plugins $plugins_to_add)"
else
	plugins="plugins=($plugins_to_add)"
fi

sed -i "s/^plugins=([^)]*)/$plugins/" $HOME/.zshrc
