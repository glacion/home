{ pkgs, ... }:
{
  home.packages = with pkgs; [
    crane
    docker
    docker-buildx
    docker-compose
    dockerfile-language-server
    skopeo
  ];
}
