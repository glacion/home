{ pkgs, ... }:
{
  home.packages = with pkgs; [ (python3.withPackages (ps: with ps; [ uv ])) ];
  home.sessionPath = [ "$HOME/.local/bin" ];
}
