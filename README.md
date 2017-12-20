
Repository pour partager mes fichier de conf de neovim entre mes différentes terminaux.
En parti basé sur le repo https://github.com/nelstrom/dotfiles de Drew Neil

# dotnvim
configure files of nvim

Dependencies:
python-dev, python3-dev, python-pip, python3-pip
# node & npm
sudo apt install node
# ubtuntu : sudo apt install nodejs
sudo apt install php7.0

Installation:

    git clone git://github.com/GodefroyClair/dotnvim.git ~/.config/nvim/

Install minpac:

    git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
 
Install pip & npm dep:
    pip3 install neovim
    npm install -g tern
    npm install -g import-js
    npm install -g typescript
    npm install -g neovim
    

In vim:
    :PackUpdate
    :CheckHealth


todo : 
Install ycm, snippets..
