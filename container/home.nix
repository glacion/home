{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dive
    docker
    docker-buildx
    docker-compose
    lazydocker
    skopeo
    trivy
  ];
}
