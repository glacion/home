{
  description = "Sentinel system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # Local modules
    bun.url = "path:../../bun";
    cloud.url = "path:../../cloud";
    container.url = "path:../../container";
    core.url = "path:../../core";
    darwin.url = "path:../../darwin";
    dev.url = "path:../../dev";
    go.url = "path:../../go";
    kubernetes.url = "path:../../kubernetes";
    nodejs.url = "path:../../nodejs";
    nvim.url = "path:../../nvim";
    opencode.url = "path:../../opencode";
    python.url = "path:../../python";
    rust.url = "path:../../rust";
    utility.url = "path:../../utility";
    zsh.url = "path:../../zsh";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, ... }:
    let
      default = [
        inputs.bun.default
        inputs.cloud.default
        inputs.container.default
        inputs.core.default
        inputs.dev.default
        inputs.go.default
        inputs.kubernetes.default
        inputs.nodejs.default
        inputs.nvim.default
        inputs.opencode.default
        inputs.python.default
        inputs.rust.default
        inputs.utility.default
        inputs.zsh.default
      ];
    in
    {
      darwinConfigurations."sentinel" = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
          ./homebrew.nix
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          {
            home-manager = {
              backupFileExtension = "bak";
              users.glacion = {
                imports = default ++ [ inputs.darwin.default ];
              };
            };
          }
        ];
        specialArgs = { inherit self inputs; };
      };
    };
}
