{
  description = "The TeamSpeak 3 client without Qt5 WebEngine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./overlay.nix
      ];
      systems = [
        "x86_64-linux"
      ];
      perSystem = {pkgs, ...}: {
        packages = import ./packages {inherit pkgs;};
      };
    };
}
