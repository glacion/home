{ pkgs, lib, ... }: {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
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
      "source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh"
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
}
