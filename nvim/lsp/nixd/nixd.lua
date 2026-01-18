vim.api.nvim_create_autocmd("FileType", {
  pattern = { "nix" },
  callback = function(event)
    local root_markers = { "flake.nix", ".git" }
    local root_dir = vim.fs.root(event.buf, root_markers) or vim.fn.getcwd()

    vim.lsp.start({
      name = "nixd",
      cmd = { "nixd" },
      root_dir = root_dir,
      settings = {
        nixd = {
          nixpkgs = {
            expr = "import <nixpkgs> { }",
          },
          formatting = {
            command = { "nixfmt" },
          },
          options = {
            nixos = {
              expr = '(builtins.getFlake "/etc/nixos").nixosConfigurations.nixos.options',
            },
            home_manager = {
              expr = '(builtins.getFlake "'
                .. os.getenv("HOME")
                .. '/.config/home-manager").homeConfigurations.glacion.options',
            },
          },
        },
      },
    })
  end,
})
