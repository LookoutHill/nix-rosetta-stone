let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in pkgs.mkShellNoCC {
  packages = with pkgs; [
    cowsay
    lolcat
  ];

  name = "devShells.default";
  shellHook = "echo $MSG | cowsay | lolcat";
  MSG = ">|devShells.default|<";
}
