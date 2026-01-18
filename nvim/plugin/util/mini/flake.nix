{
  description = "Mini plugin configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          imports = [
            ((import ./move/flake.nix).outputs { }).default
            ((import ./surround/flake.nix).outputs { }).default
          ];
        }
      );
    };
}
