mkdir -p ~/bin
 
wget https://nodejs.org/dist/v8.9.3/node-v8.9.3-linux-x64.tar.xz
tar xvfJ node-v8.9.3-linux-x64.tar.xz -C ~/bin/
echo "PATH="'"$HOME/bin/node-v8.9.3-linux-x64/bin:$PATH"'"" >> ~/.profile
source ~/.profile

npm -v
