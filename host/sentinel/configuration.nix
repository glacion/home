{ pkgs, self, ... }: {
  nix.enable = false;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  environment.systemPackages = [
    pkgs.curl
    pkgs.git
    pkgs.home-manager
    pkgs.neovim
  ];

  system = {
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "glacion";
    stateVersion = 6;
    defaults = {
      loginwindow.GuestEnabled = false;
      dock = {
        autohide = true;
        mru-spaces = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "clmv";
      };
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 2;
      };
    };
  };

  users.users.glacion = {
    home = "/Users/glacion";
    name = "glacion";
  };
}
