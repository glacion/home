{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (python3.withPackages (python3: with python3; [ uv ]))
    ruff
    ty
  ];
  home.sessionPath = [ "$HOME/.local/bin" ];
}
