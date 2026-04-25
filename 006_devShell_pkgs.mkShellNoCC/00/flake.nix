{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs @ { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in {
        devShells.default = pkgs.mkShellNoCC {
          name = "devShells.${system}.default";
          shellHook = "echo $MSG";
          MSG = ">|devShells.${system}.default|<";
        };
      }
    );
}
