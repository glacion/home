{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = "github:hercules-ci/flake-parts";
    };

    nix-darwin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-darwin/nix-darwin/master";
    };

    nix-ld = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-ld";
    };

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    rust-overlay = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:oxalica/rust-overlay";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      imports = [
        ./host
      ];
    };
}
