{
  description = "Rust nightly toolchain configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, rust-overlay, ... }:
    {
      default = (
        { pkgs, ... }:
        let
          overlays = [ (import rust-overlay) ];
          rustPkgs = import nixpkgs {
            system = pkgs.stdenv.hostPlatform.system;
            inherit overlays;
          };
        in
        {
          home.packages = [
            (rustPkgs.rust-bin.nightly.latest.default.override {
              extensions = [
                "rust-src"
                "rust-analyzer"
                "clippy"
              ];
            })
          ];
          home.sessionPath = [ "$HOME/.cargo/bin" ];
        }
      );
    };
}
