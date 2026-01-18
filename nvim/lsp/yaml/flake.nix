{
  description = "YAML LSP configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.extraPackages = [ pkgs.yaml-language-server ];
          xdg.configFile."nvim/plugin/yamlls.lua".source = ./yamlls.lua;
        }
      );
    };
}
