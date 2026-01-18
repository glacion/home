{ pkgs, ... }:
let
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  home = {
    username = "glacion";
    homeDirectory = if isDarwin then "/Users/glacion" else "/home/glacion";
    stateVersion = "25.11";
    packages = with pkgs; [
      awscli2
      bandwhich
      buck2
      bun
      dive
      doggo
      erdtree
      google-cloud-sdk
      jq
      k9s
      kubecolor
      kubernetes-helm
      kubectl
      lazydocker
      nmap
      opentofu
      pluto
      pueue
      skopeo
      stern
      stylua
      trivy
      viddy
      yq
    ];
  };
}
