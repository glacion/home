{
  description = "Completion plugin configuration";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ((import ./blink/flake.nix).outputs { }).default
          ((import ./luasnip/flake.nix).outputs { }).default
        ];
      };
    };
}
