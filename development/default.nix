{ ... }:
{
  imports = [
    ./cloud.nix
    ./container.nix
    ./database.nix
    ./git.nix
    ./build.nix
    ./kubernetes.nix
    ./nvim
    ./opencode.nix
    ./utility.nix
    ./zsh
  ];
}
