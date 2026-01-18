{
  description = "Darwin-specific configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          nixpkgs.config.allowUnfree = true;
          home.packages = [ pkgs.colima pkgs.google-chrome pkgs.slack pkgs.wezterm pkgs.nerd-fonts.hasklug ];
        }
      );
    };
}
