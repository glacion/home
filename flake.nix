{
  description = "Home Manager configuration for Citadel and Sentinel";
  inputs = {
    bun.url = "path:./bun";
    core.url = "path:./core";
    go.url = "path:./go";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nodejs.url = "path:./nodejs";
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
      core,
      go,
      home-manager,
      nixpkgs,
      nodejs,
      nvim,
      opencode,
      python,
      rust,
      darwin,
      wsl,
      zsh,
      ...
    }:
    let
      default = [
        bun.default
        core.default
        go.default
        nodejs.default
        nvim.default
        opencode.default
        python.default
        rust.default
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
