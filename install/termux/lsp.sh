# setup neovim
pkg install luarocks luajit
luarocks install luacheck
# install lsp
# bun install -g --backend=
# bun pm ls -g
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
pkg install taplo -y
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
chmod +x ~/../usr/bin/astrofm

# go lsp linter
go install github.com/nametake/golangci-lint-langserver@latest
mv ~/go/bin/golangci-lint-langserver ~/../usr/bin/
# go linter
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
mv ~/go/bin/golangci-lint ~/../usr/bin/