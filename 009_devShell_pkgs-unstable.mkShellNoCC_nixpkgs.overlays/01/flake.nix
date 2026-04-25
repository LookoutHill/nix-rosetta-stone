{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs @ { nixpkgs, nixpkgs-unstable, ... }:
    let
      pkgs-aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin;
      pkgs-aarch64-linux = nixpkgs.legacyPackages.aarch64-linux;
      pkgs-x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin;
      pkgs-x86_64-linux = nixpkgs.legacyPackages.x86_64-linux;

      pkgs-unstable-aarch64-darwin = import nixpkgs-unstable {
        system = "aarch64-darwin";
        config.allowUnfree = true;
      };

      pkgs-unstable-aarch64-linux = import nixpkgs-unstable {
        system = "aarch64-linux";
        config.allowUnfree = true;
      };

      pkgs-unstable-x86_64-darwin = import nixpkgs-unstable {
        system = "x86_64-darwin";
        config.allowUnfree = true;
      };

      pkgs-unstable-x86_64-linux = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in {
      devShells.aarch64-darwin.default = pkgs-unstable-aarch64-darwin.mkShellNoCC {
        name = "devShells.aarch64-darwin.default";
        shellHook = "echo $MSG";
        MSG = ">0|devShells.aarch64-darwin.default|0<";
      };

      devShells.aarch64-linux.default = pkgs-unstable-aarch64-linux.mkShellNoCC {
        name = "devShells.aarch64-linux.default";
        shellHook = "echo $MSG";
        MSG = ">1|devShells.aarch64-linux.default|1<";
      };

      devShells.x86_64-darwin.default = pkgs-unstable-x86_64-darwin.mkShellNoCC {
        name = "devShells.x86_64-darwin.default";
        shellHook = "echo $MSG";
        MSG = ">2|devShells.x86_64-darwin.default|2<";
      };

      devShells.x86_64-linux.default = pkgs-unstable-x86_64-linux.mkShellNoCC {
        name = "devShells.x86_64-linux.default";
        shellHook = "echo $MSG";
        MSG = ">3|devShells.x86_64-linux.default|3<";
      };

      nixpkgs.overlays.aarch64-darwin = [
        (self: super: { mesa = pkgs-unstable-aarch64-darwin.mesa; })
      ];

      nixpkgs-unstable.overlays.aarch64-darwin = [
        (self: super: { mesa = pkgs-aarch64-darwin.mesa; })
      ];

      nixpkgs.overlays.aarch64-linux = [
        (self: super: { mesa = pkgs-unstable-aarch64-linux.mesa; })
      ];

      nixpkgs-unstable.overlays.aarch64-linux = [
        (self: super: { mesa = pkgs-aarch64-linux.mesa; })
      ];

      nixpkgs.overlays.x86_64-darwin = [
        (self: super: { mesa = pkgs-unstable-x86_64-darwin.mesa; })
      ];

      nixpkgs-unstable.overlays.x86_64-darwin = [
        (self: super: { mesa = pkgs-x86_64-darwin.mesa; })
      ];

      nixpkgs.overlays.x86_64-linux = [
        (self: super: { mesa = pkgs-unstable-x86_64-linux.mesa; })
      ];

      nixpkgs-unstable.overlays.x86_64-linux = [
        (self: super: { mesa = pkgs-x86_64-linux.mesa; })
      ];
    };
}
