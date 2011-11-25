This is my configuration of Arch Linux + Xmonad + Zsh. At the moment, the repository is far from being complete and includes just Zsh configs and simple install scripts.

# Zsh Configuration

1. First of all, you need to clone the repository of oh-my-zsh to your home directory:

    ```shell 
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh```

2. Then, you need to clone this repository to any directory you want:

    ```shell
    git clone git@github.com:beloglazov/arch-xmonad-zsh.git```

3. You need to cd into the cloned repository:

    ```shell
    cd arch-xmonad-zsh```

4. And run the installation script, which will create symbolic links to .zshenv and .zshrc in your home directory:

   ```shell
   ./install.sh```

5. If you want to install the same configuration for root, just run the following script and enter your sudo password:

   ```shell
   ./install-root.sh```

6. Now you need to restart your shell to see the changes.


Enjoy!
