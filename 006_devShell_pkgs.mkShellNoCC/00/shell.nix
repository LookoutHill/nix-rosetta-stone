{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShellNoCC {
  name = "devShells.default";
  shellHook = "echo $MSG";
  MSG = ">|devShells.default|<";
}
