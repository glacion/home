{
  description = "LSP Attach configuration";
  outputs =
    { ... }:
    {
      default = (
        { ... }:
        {
          xdg.configFile."nvim/plugin/attach.lua".source = ./config.lua;
        }
      );
    };
}
