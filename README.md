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

### SSH - Login 

#### SSH - Login with username & port
```
ssh username@ip -p [port-number]
```
#### SSH - Login with Keypem
```
chmod 400 key.pem
ssh -i key.pem username@ip
```
#### SSH - login with rsa
```
updating...
```



