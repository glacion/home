{ ... }:
{
  programs = {
    lazygit.enable = true;
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
  };
}
