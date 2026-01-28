{
  pkgs,
  inputs,
  nixpkgsConfig,
  nixpkgsOverlays,
  ...
}:
{
  networking.hostName = "sentinel";
  time.timeZone = "Europe/Istanbul";
  security.pam.services.sudo_local.touchIdAuth = true;

  environment.systemPackages = with pkgs; [
    colima
    coreutils
    findutils
    gnugrep
    gnused
    gnutar
    home-manager
  ];

  nix.enable = false;
  system.tools.darwin-rebuild.enable = true;
  programs.zsh.enable = true;
  nixpkgs = {
    config = nixpkgsConfig;
    hostPlatform = "aarch64-darwin";
    overlays = nixpkgsOverlays;
  };

  system = {
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
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

  # Homebrew
  homebrew = {
    enable = true;
    casks = [
      "bentobox"
      "font-hasklug-nerd-font"
      "google-chrome"
      "notion"
      "slack"
      "spotify"
      "tailscale-app"
      "telegram"
      "wezterm@nightly"
      "whatsapp"
    ];
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    taps = [
      "wez/wezterm"
    ];
  };

  nix-homebrew = {
    autoMigrate = true;
    enable = true;
    enableRosetta = true;
    user = "glacion";
  };
}
