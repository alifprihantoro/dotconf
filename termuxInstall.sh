cd
rm ../usr/etc/motd
pkg update -y
pkg upgrade -y
# install cli tools
pkg install bat gh git openssh zsh lsd fzf tmux ripgrep termux-api yq which make man aria2 htop -y
# add glibc
pacman -S glibc-runner
# setup git
git config --global user.email "alifprihantoro@gmail.com"
git config --global user.name "alifprihantoro"
git config --global core.editor nvim
# install db
pkg install postgresql mariadb -y
# install language and related tools
pkg install nodejs eslint golang rust php composer python python-pip -y
npm i -g pnpm         # install pnpm
pnpm i -g live-server # tools live server
# install wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar ~/../usr/bin/wp

local r=.myconf
rt=$r/tmux/
ln -s $r/zsh/.zshrc
ln -s $r/bash/.bashrc
ln -s $rt.tmux.conf
rm -rf .termux
ln -s $r/termux
mv termux .termux
chsh -s zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
tic -x $rt/xterm-256color-italic.terminfo
tic -x $rt/tmux-256color.terminfo
# setup neovim
pkg install luarocks luajit
luarocks install luacheck
# install lsp
pnpm i -g vscode-langservers-extracted # html,css,json, eslint
pnpm i -g typescript                   # typescript compiler
pnpm i -g typescript-language-server   # lsp js/ts/tsx
pnpm i -g cssmodules-language-server   # css module lsp
pnpm i -g @astrojs/language-server     # astrojs lsp
pnpm i -g yaml-language-server         # yaml lsp
pnpm i -g bash-language-server         # bash lsp
pnpm i -g pyright
pnpm i -g @tailwindcss/language-server # tailwind lsp
pnpm i -g @mdx-js/language-server      # mdx lsp
pkg install lua-language-server -y     # lsp lua
# lsp rust
git clone --depth=1 https://github.com/rust-lang/rust-analyzer.git
cd rust-analyzer
cargo xtask install --server
mv ~/.cargo/bin/rust-analyzer ~/../usr/bin/rust-analyzer
chmod 777 ~/../usr/bin/rust-analyzer
# php lsp
cd
curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
chmod a+x phpactor.phar
mv phpactor.phar ~/../usr/bin/phpactor
# lsp golang
go install golang.org/x/tools/gopls@latest
mv ~/go/bin/gopls ~/../usr/bin/

# install formatter
pkg install stylua -y # lua
pkg install shfmt -y  # bash
pnpm i -g prettierd   # formatter
echo '#!/bin/sh\necho "$(cat $1 | $PNPM_HOME/prettierd $1)"' >~/../usr/bin/astrofm
chmod +x ~/../usr/bin/astrofm

# go lsp linter
go install github.com/nametake/golangci-lint-langserver@latest
mv ~/go/bin/golangci-lint-langserver ~/../usr/bin/
# go linter
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
mv ~/go/bin/golangci-lint ~/../usr/bin/
