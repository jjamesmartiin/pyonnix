# TODO:
Feel free to make an issue if you have any suggestions or improvements.

# Introduction
This repository is a way for me to easily template and create new python projects in nixos. 

There might be a better way to make the environment (maybe by adding it to the nix store?) but I haven't personally felt like it was neccessary yet.

This seems to work for making python terminal apps and basic charting. Feel free to fork or copy and use for your own needs.  

### Note:
- If you are using this without `nixpkgs` set in `NIX_PATH` (check with `echo $NIX_PATH`), you will need to run `NIX_BUILD_PATH=/bin/bash nix-shell pyonnix/pyenv.nix`
    - as of 250415 I should be handling it... the only time you really should get this problem is when using Nix on a non-nixos system like Ubuntu.

# Use
**TLDR:**
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
echo "import pyonnix/shell.nix" > shell.nix # create a shell.nix file in the root of your project
```
- now you can run `nix-shell` and it will create a shell with the dependencies in the shell.nix file and the python packages specified in the requirements.txt file.
- You can also add any other dependencies you want to the shell.nix file or the requirements.txt file.

# Cleanup
```bash
git submodule deinit -f -- pyonnix
git rm -f pyonnix
rm -rf .git/modules/pyonnix
```
