{ pkgs, self, ... }: {
  nix.enable = false;
  networking.hostName = "sentinel";
  time.timeZone = "Europe/Istanbul";
  security.pam.services.sudo_local.touchIdAuth = true;

  environment.systemPackages = [
    pkgs.curl
    pkgs.git
    pkgs.home-manager
    pkgs.nh
  ];

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  system = {
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "glacion";
    stateVersion = 6;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
    defaults = {
      loginwindow.GuestEnabled = false;
      spaces.spans-displays = false;
      dock = {
        autohide = true;
        largesize = 96;
        magnification = true;
        mru-spaces = false;
        tilesize = 48;
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

  power.sleep.display = "never";

  users.users.glacion = {
    home = "/Users/glacion";
    name = "glacion";
  };
}
