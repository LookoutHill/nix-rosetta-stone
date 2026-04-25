{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/10e7ad5bbcb421fe07e3a4ad53a634b0cd57ffac.tar.gz") {} }:
pkgs.mkShell {
  name = "devShells.default";
  shellHook = "echo $MSG";
  MSG = ">|devShells.default|<";
}
