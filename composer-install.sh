cd ~
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mkdir -p ~/bin/
mv composer.phar ~/bin/composer
chmod +x ~/bin/composer
composer
