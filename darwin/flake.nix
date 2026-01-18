{
  description = "Darwin-specific configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          home.packages = [ pkgs.google-chrome ];
        }
      );
    };
}
