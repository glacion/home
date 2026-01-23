{ ... }: {
  imports = [
    ./core
    ./lsp
    ./plugin
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
