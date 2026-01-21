{ config, ... }:
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
        pull = {
          rebase = true;
        };
        user = {
          name = "Can Güvendiren";
          email = "can@glacion.com";
        };
      };
      signing = {
        signer = "ssh";
        key = "~/.ssh/id_ed25519";
      };
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
    nh = {
      enable = true;
      flake = "${config.home.homeDirectory}/.config/home";
    };
    mise = {
      enable = true;
      enableZshIntegration = true;
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
