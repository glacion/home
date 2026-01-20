{ pkgs, ... }:
{
  home.packages = with pkgs; [
    k9s
    kubecolor
    kubectl
    kubernetes-helm
    pluto
    stern
  ];
}
