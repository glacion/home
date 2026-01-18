{
  description = "Git plugin configuration";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ((import ./gitsign/flake.nix).outputs { }).default
        ];
      };
    };
}
