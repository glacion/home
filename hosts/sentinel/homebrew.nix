{ ... }: {
  homebrew = {
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
    enable = true;
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
