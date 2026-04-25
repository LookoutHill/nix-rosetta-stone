let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in pkgs.mkShell {
  name = "devShells.default";
  shellHook = "echo $MSG";
  MSG = ">|devShells.default|<";
}
