# script install composer automatically on UBUNTU
cd ~
if [ -f composer-install.sh ]; then
    rm -f composer-install.sh
fi
if hash apt-get 2>/dev/null; then
  sudo apt-get install -y php php-common
else
  sudo yum install -y php php-common
fi
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mkdir -p ~/bin/
mv composer.phar ~/bin/composer
chmod +x ~/bin/composer
if hash composer 2>/dev/null; then
  echo "script run successful!"
else
  echo "script run failed!"
fi
