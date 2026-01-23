{ pkgs, ... }: {
  home.packages = with pkgs; [
    bandwhich
    doggo
    erdtree
    jq
    mongodb-tools
    nmap
    pueue
    viddy
    yq
  ];
}
