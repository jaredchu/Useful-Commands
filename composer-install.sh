# script install composer automatically on UBUNTU
cd ~
sudo apt-get -y install php php-common php-mbstring php-dom
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mkdir -p ~/bin/
mv composer.phar ~/bin/composer
chmod +x ~/bin/composer
composer
echo "script run successful"
