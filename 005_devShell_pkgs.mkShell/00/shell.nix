{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  name = "devShells.default";
  shellHook = "echo $MSG";
  MSG = ">|devShells.default|<";
}
