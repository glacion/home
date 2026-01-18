{
  description = "Javascript/Typescript LSP configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.extraPackages = [
            pkgs.biome
            pkgs.vtsls
          ];
          xdg.configFile."nvim/plugin/biome.lua".source = ./biome.lua;
          xdg.configFile."nvim/plugin/vtsls.lua".source = ./vtsls.lua;
        }
      );
    };
}
