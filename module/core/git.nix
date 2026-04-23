{ ... }:
{
  programs = {
    lazygit.enable = true;
    git = {
      enable = true;
      settings = {
        init = {
          defaultBranch = "main";
        };
        pull = {
          rebase = true;
        };
        user = {
          name = "Can Güvendiren";
          email = "can@glacion.com";
        };
      };
      signing = {
        format = "ssh";
        key = "~/.ssh/id_ed25519";
        signByDefault = true;
      };
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
  };
}
