{
  description = "Debug plugin configuration";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ((import ./dap/flake.nix).outputs { }).default
          ((import ./dap_ui/flake.nix).outputs { }).default
          ((import ./dap_virtual_text/flake.nix).outputs { }).default
        ];
      };
    };
}
