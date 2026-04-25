{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShellNoCC {
  packages = with pkgs; [
    cowsay
    lolcat
  ];

  name = "devShells.default";
  shellHook = "echo $MSG | cowsay | lolcat";
  MSG = ">|devShells.default|<";
}
