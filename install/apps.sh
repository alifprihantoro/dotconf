go install github.com/google/osv-scanner/cmd/osv-scanner@main # use main because latest ver. have bug for pnpm
npm i -g pnpm                                                 # install pnpm
pnpm i -g live-server                                         # tools live server
# install wordpress
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar ~/../usr/bin/wp
source $dc/install/lsp.sh
