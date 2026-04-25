{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs =
    inputs @ { nixpkgs, ... }:
    let
      pkgs-aarch64-darwin = inputs.nixpkgs.legacyPackages.aarch64-darwin;
      pkgs-aarch64-linux = inputs.nixpkgs.legacyPackages.aarch64-linux;
      pkgs-x86_64-darwin = inputs.nixpkgs.legacyPackages.x86_64-darwin;
      pkgs-x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShells.aarch64-darwin.default = pkgs-aarch64-darwin.mkShellNoCC {
        name = "devShells.aarch64-darwin.default";
        shellHook = "echo $MSG";
        MSG = ">0|devShells.aarch64-darwin.default|0<";
      };

      devShells.aarch64-linux.default = pkgs-aarch64-linux.mkShellNoCC {
        name = "devShells.aarch64-linux.default";
        shellHook = "echo $MSG";
        MSG = ">1|devShells.aarch64-linux.default|1<";
      };

      devShells.x86_64-darwin.default = pkgs-x86_64-darwin.mkShellNoCC {
        name = "devShells.x86_64-darwin.default";
        shellHook = "echo $MSG";
        MSG = ">2|devShells.x86_64-darwin.default|2<";
      };

      devShells.x86_64-linux.default = pkgs-x86_64-linux.mkShellNoCC {
        name = "devShells.x86_64-linux.default";
        shellHook = "echo $MSG";
        MSG = ">3|devShells.x86_64-linux.default|3<";
      };
    };
}
