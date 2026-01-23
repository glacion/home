{ pkgs, ... }: {
  home.packages = [ pkgs.wsl-open ];
  programs.zsh.shellAliases = {
    open = "wsl-open";
  };
}
