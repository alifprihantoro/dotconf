wp_install(){
  pkg install php mariadb -y
  cd ~/
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar ../usr/bin/wp
  wp --info
}

wp_setup_db(){
  if [[ "$1" == *help* || "$1" == *-h* ]]; then
    echo "
wp_setup_db <db_name> <username> <passwd>
    "
  fi
  local db_name=$1
  local username=$2
  local passwd=$3
  echo "
start mariadb with command mariadbd-safe or mariadbd
and copy this text into mariadb :

=============
CREATE DATABASE $db_name;
GRANT ALL PRIVILEGES ON $db_name.* TO \"$username\"@\”localhost\” IDENTIFIED BY \”$passwd\”;
FLUSH PRIVILEGES;
exit
=============

execute this command : cp wp-config-sample.php wp-config.php
then copy this text and paste/replace to wp-config.php

=============
define( 'DB_NAME', '$db_name' );

/** Database username */
define( 'DB_USER', '$username' );

/** Database password */
define( 'DB_PASSWORD', '$passwd' );

/** Database hostname */
define( 'DB_HOST', '127.0.0.1' );
=============

then start with wp_start or php -S localhost:8080
  "
}

wp_start(){
  php -S localhost:8080
}