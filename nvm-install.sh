#!/bin/bash
# Check the latest version of NVM
curl https://github.com/nvm-sh/nvm/releases/latest | cut -d \/ -f 8 | cut -d \" -f 1
# Run the install script
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
# Paste in this scripts into your .bashrc or .bash_profile
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# Install node and npm
nvm ls-remote
nvm install lts/gallium   # Change the version according to your reference
nvm alias default lts/gallium

