# Introduction
This repository is a way for me to easily template and create new python projects in nixos. 

There might be a better way to make the environment (maybe by adding it to the nix store?) but I haven't personally felt like it was neccessary yet.

This seems to work for making python terminal apps and basic charting. Feel free to fork or copy and use for your own needs.  

# Use
TLDR:
```
git submodule add https://github.com/jjamesmartiin/pyonnix.git
echo "import pyonnix/shell.nix" > shell.nix # create a shell.nix file in the root of your project
nix-shell
```

-----

This repo is probably best included as a submodule I think. Here's the command:
```bash
git submodule add https://github.com/jjamesmartiin/pyonnix.git
```

Now make a shell.nix file. The location should be at the root of your project (like with the requirements.txt file). 
```nix
import pyonnix/shell.nix
```
- now you can run `nix-shell` and it will create a shell 
- with the dependencies in the shell.nix file
