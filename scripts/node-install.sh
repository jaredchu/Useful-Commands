cd /tmp
mkdir -p ~/bin

NODE_VERSION=v12.19.0
ARCHIVE_NAME=node-$NODE_VERSION-linux-x64
ARCHIVE_FILE=$ARCHIVE_NAME.tar.xz
 
curl -O https://nodejs.org/dist/$NODE_VERSION/$ARCHIVE_FILE
mv ~/bin/node-latest ~/bin/node-latest__$(date +%F-%T)
tar xvfJ $ARCHIVE_FILE -C ~/bin/
mv ~/bin/$ARCHIVE_NAME ~/bin/node-latest

grep -qxF "PATH="'"$HOME/bin/node-latest/bin:$PATH"'"" ~/.profile || echo "PATH="'"$HOME/bin/node-latest/bin:$PATH"'"" >> ~/.profile
source ~/.profile
npm -v
node -v
