{ pkgs, ... }:
{
  home.sessionPath = [ "$HOME/.cargo/bin" ];
  home.packages = [
    (pkgs.rust-bin.nightly.latest.default.override {
      extensions = [
        "rust-src"
        "rust-analyzer"
        "clippy"
      ];
    })
  ];
}
