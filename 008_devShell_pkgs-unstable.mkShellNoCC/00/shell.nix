let
  nixpkgs-unstable = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable";
  pkgs-unstable = import nixpkgs-unstable { config = {}; overlays = []; };
in pkgs-unstable.mkShellNoCC {
  name = "devShells.default";
  shellHook = "echo $MSG";
  MSG = ">|devShells.default|<";
}
