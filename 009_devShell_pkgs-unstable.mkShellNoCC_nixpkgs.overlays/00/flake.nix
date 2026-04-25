{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs @ { nixpkgs, nixpkgs-unstable, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages."${system}";

        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        devShells.default = pkgs-unstable.mkShellNoCC {
          name = "devShells.${system}.default";
          shellHook = "echo $MSG";
          MSG = ">|devShells.${system}.default|<'";
        };

        nixpkgs.overlays = [
          (self: super: { mesa = pkgs-unstable.mesa; })
        ];

        nixpkgs-unstable.overlays = [
          (self: super: { mesa = pkgs.mesa; })
        ];
      }
    );
}
