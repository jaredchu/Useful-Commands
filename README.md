# Linux Useful Commands
My linux useful commands with simple explaination

[![Travis](https://img.shields.io/travis/jaredchu/useful-commands.svg)](https://travis-ci.org/jaredchu/useful-commands)

# SSH
## SSH - Keygen

### Generate SSH key
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
refs https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

### Retrieve the public key from a SSH private key
```
ssh-keygen -y -f ~/.ssh/id_rsa > ~/.ssh/id_rsa.pub
```
refs http://askubuntu.com/questions/53553/how-do-i-retrieve-the-public-key-from-a-ssh-private-key

## SSH - Login 

### Login with username & port
```
ssh username@ip -p [port-number]
```
### Login with Keypem
```
chmod 400 key.pem
ssh -i key.pem username@ip -p [port-number]
```
### login with rsa
```
#backup current id.rsa
mv ~/.ssh/id.rsa ~/.ssh/id.rsa.bak
mv ~/.ssh/id.rsa.pub ~/.ssh/id.rsa.pub bak

#copy all rsa to ~/.ssh/
cp file.rsa ~/.ssh/

ssh username@ip -p [port-number]
```
# SCP
### Copy file from local to remote server
```
scp path/to/file.ext username@hostname://path/to/folder/
```
# Database
## PostgreSQL
### Remote connect
```
psql -U username -h hostname/ip/urn database-name
```
# File and folder
### Empty all files in current folder
```
find . -type f -exec sh -c '>{}' \;
```
### Check number of nodes in current 
```
for dir in *; do [ -d "$dir" ] && echo "$dir" && find "$dir" | wc -l; done
```

# Java
### Run java spring with port
```
java -Dserver.port=$PORT -jar target/file.jar
```
# Laravel
### Fix project not run the in first time install
```
cp .env.example .env
php artisan key:generate
php artisan config:cache
```
# Mysql on MAC
### Start MySQL
```
sudo /usr/local/mysql/support-files/mysql.server start
```
### Stop MySQL
```
sudo /usr/local/mysql/support-files/mysql.server stop
```
### Restart MySQL
```
sudo /usr/local/mysql/support-files/mysql.server restart
```
### Reset root password
```
sudo /usr/local/mysql/bin/mysqld_safe --skip-grant-tables
mysql -uroot
UPDATE mysql.user SET authentication_string=PASSWORD('root') WHERE User='root';
FLUSH PRIVILEGES;
exit

sudo /usr/local/mysql/support-files/mysql.server restart
```
# LEMP
### Install LEMP on AWS AMI
```
sudo -i
wget https://raw.githubusercontent.com/jaredchu/useful-commands/master/aws-php-fcgi.sh
chmod +x aws-php-fcgi.sh
nano aws-php-fcgi.sh # edit JC_ROOT_FOLDER
./aws-php-fcgi.sh
```
