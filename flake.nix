{
  description = "Home Manager configuration for Citadel and Sentinel";
  inputs = {
    bun.url = "path:./bun";
    cloud.url = "path:./cloud";
    container.url = "path:./container";
    core.url = "path:./core";
    dev.url = "path:./dev";
    go.url = "path:./go";
    kubernetes.url = "path:./kubernetes";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nodejs.url = "path:./nodejs";
    utility.url = "path:./utility";
    nvim.url = "path:./nvim";
    opencode.url = "path:./opencode";
    python.url = "path:./python";
    rust.url = "path:./rust";
    darwin.url = "path:./darwin";
    wsl.url = "path:./wsl";
    zsh.url = "path:./zsh";
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
  };

    outputs =
    {
      bun,
      cloud,
      container,
      core,
      dev,
      go,
      home-manager,
      kubernetes,
      nixpkgs,
      nodejs,
      nvim,
      opencode,
      python,
      rust,
      darwin,
      utility,
      wsl,
      zsh,
      ...
    }:
    let
      default = [
        bun.default
        cloud.default
        container.default
        core.default
        dev.default
        go.default
        kubernetes.default
        nodejs.default
        nvim.default
        opencode.default
        python.default
        rust.default
        utility.default
        zsh.default
      ];
    in
    {
      homeConfigurations = {
        "glacion@citadel" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = default ++ [ wsl.default ];
        };
        "glacion@sentinel" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          modules = default ++ [ darwin.default ];
        };
      };
    };
}
