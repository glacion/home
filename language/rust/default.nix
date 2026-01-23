{ pkgs, ... }:
{
  home.packages = [
    (pkgs.rust-bin.nightly.latest.default.override {
      extensions = [
        "rust-src"
        "rust-analyzer"
        "clippy"
      ];
    })
  ];
  home.sessionPath = [ "$HOME/.cargo/bin" ];
}
