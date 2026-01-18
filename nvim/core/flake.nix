{
  description = "Neovim Core configuration";
  outputs =
    { ... }:
    {
      default = (
        { ... }:
        {
          xdg.configFile."nvim/plugin/config.lua".source = ./config.lua;
        }
      );
    };
}
