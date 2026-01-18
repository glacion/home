{
  description = "UI plugin configuration";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ((import ./barbar/flake.nix).outputs { }).default
          ((import ./colorizer/flake.nix).outputs { }).default
          ((import ./indent_blankline/flake.nix).outputs { }).default
          ((import ./lualine/flake.nix).outputs { }).default
          ((import ./noice/flake.nix).outputs { }).default
          ((import ./nvim_tree/flake.nix).outputs { }).default
          ((import ./onedarkpro/flake.nix).outputs { }).default
          ((import ./snack/flake.nix).outputs { }).default
          ((import ./treesitter_context/flake.nix).outputs { }).default
          ((import ./trouble/flake.nix).outputs { }).default
          ((import ./web_devicon/flake.nix).outputs { }).default
        ];
      };
    };
}
