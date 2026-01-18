{ ... }:
{
  programs = {
    bat.enable = true;
    bottom.enable = true;
    eza.enable = true;
    fd.enable = true;
    fzf.enable = true;
    home-manager.enable = true;
    lazygit.enable = true;
    ripgrep.enable = true;
    atuin = {
      enable = true;
      enableZshIntegration = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "Can Güvendiren";
          email = "can@glacion.com";
        };
      };
      signing.signer = "ssh";
      signing.key = "~/.ssh/id_ed25519";
    };
    nh = {
      enable = true;
      flake = "/home/glacion/.config/home-manager";
    };
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks."*" = {
        extraOptions = {
          AddKeysToAgent = "yes";
        };
      };
    };
  };
}
