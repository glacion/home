{
  description = "Shell/Bash LSP configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.extraPackages = [ pkgs.bash-language-server ];
          xdg.configFile."nvim/plugin/bashls.lua".source = ./bashls.lua;
        }
      );
    };
}
