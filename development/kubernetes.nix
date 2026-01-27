{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kubecolor
    kubectl
    kubernetes-helm
    k9s
  ];
}
