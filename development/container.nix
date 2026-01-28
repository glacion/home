{ pkgs, ... }:
{
  home.packages = with pkgs; [
    crane
    docker
    docker-buildx
    docker-compose
    skopeo
  ];
}
