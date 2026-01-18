{
  description = "OpenTofu / Terraform LSP configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.extraPackages = [ pkgs.terraform-ls ];
          xdg.configFile."nvim/plugin/terraform.lua".source = ./terraform.lua;
        }
      );
    };
}
