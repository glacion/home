{
  inputs,
  pkgs,
  self,
  ...
}:
{
  imports = [
    ./homebrew.nix
  ];

  networking.hostName = "sentinel";
  time.timeZone = "Europe/Istanbul";
  security.pam.services.sudo_local.touchIdAuth = true;

  environment.systemPackages = with pkgs; [
    colima
    coreutils
    findutils
    gnugrep
    gnupg
    gnused
    gnutar
  ];

  nix.enable = false;
  programs.zsh.enable = true;
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    overlays = [
      inputs.rust-overlay.overlays.default
    ];
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

  users.users.glacion = {
    home = "/Users/glacion";
    name = "glacion";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    users.glacion = {
      home = {
        username = "glacion";
        homeDirectory = "/Users/glacion";
        stateVersion = "26.05";
      };
      programs.nh = {
        enable = true;
        flake = "/Users/glacion/.config/home";
      };
      imports = [
        ../../development
        ../core
      ];
    };
  };
}
