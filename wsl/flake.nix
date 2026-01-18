{
  description = "WSL-specific configuration (wsl-open and alias)";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          home.packages = [ pkgs.wsl-open ];
          programs.zsh.shellAliases = {
            open = "wsl-open";
          };
        }
      );
    };
}
