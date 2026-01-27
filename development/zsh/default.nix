{ pkgs, lib, ... }:
{
  programs = {
    bat.enable = true;
    bottom.enable = true;
    fd.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
    };
    mise = {
      enable = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch.enable = true;

      shellAliases = {
        k = "kubecolor";
        kubectl = "kubecolor";
        kns = "kubecolor config set-context --current --namespace";
        kctx = "kubecolor config use-context";
      };

      initContent = lib.mkMerge [
        (builtins.readFile ./completion.zsh)
        (builtins.readFile ./function.zsh)
        (builtins.readFile ./powerlevel10k.zsh)
      ];

      oh-my-zsh = {
        enable = true;
        plugins = [ "fzf" ];
      };

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "fzf-tab";
          src = pkgs.zsh-fzf-tab;
        }
        {
          name = "zsh-completions";
          src = pkgs.zsh-completions;
        }
      ];
    };
  };
}
