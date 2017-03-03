# Linux Useful Commands
My linux useful commands with simple explaination

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
