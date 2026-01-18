{
  description = "Util plugin configuration";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ((import ./lsp_file_operation/flake.nix).outputs { }).default
          ((import ./markdown_preview/flake.nix).outputs { }).default
          ((import ./mini/flake.nix).outputs { }).default
          ((import ./undotree/flake.nix).outputs { }).default
        ];
      };
    };
}
