{
  description = "Editor plugin configuration";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ((import ./autopair/flake.nix).outputs { }).default
          ((import ./conform/flake.nix).outputs { }).default
          ((import ./smart_split/flake.nix).outputs { }).default
          ((import ./ts_context_commentstring/flake.nix).outputs { }).default
        ];
      };
    };
}
