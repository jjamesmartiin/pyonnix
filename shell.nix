# shell.nix
# use: 
  # cd .. && nix-shell pyonnix/

{ pkgs ? import <nixpkgs> {} }:

let
  NIX_PATH = builtins.getEnv "NIX_PATH";

  pkgs = if (NIX_PATH != "") then
    import <nixpkgs> {}
  else
  # lets try and add a let here to get the commit hash
    (import (fetchTarball { 
      url = "https://github.com/NixOS/nixpkgs/archive/da044451c6a70518db5b730fe277b70f494188f1.tar.gz";
      sha256 = "sha256:11z08fa0s7r9hryllhjj7kyn4z6bsixlqz7iwgsmf1k4p3hcl692";
    }) { }).pkgs;


  pythonNixpkgsDeps = with pkgs; [
    # needed for compiling stuff like yfinance
    cmake
    python312Packages.cmake
    zlib

    # for openai-whisper
    # ffmpeg
  ];
in

(pkgs.buildFHSEnv {
  name = "simpleFHS";
  targetPkgs = pkgs: (pythonNixpkgsDeps);
  multiPkgs = pkgs: (pythonNixpkgsDeps);
  runScript = if (NIX_PATH != "") then
    "nix-shell pyonnix/pyenv.nix"
  else
    "NIX_BUILD_PATH=/bin/bash nix-shell pyonnix/pyenv.nix"; # this is a workaround for the issue with the NIX_PATH env variable
    # "NIX_BUILD_PATH=$(which bash)";
}).env
