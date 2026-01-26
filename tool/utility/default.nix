{ pkgs, ... }: {
  home.packages = with pkgs; [
    bandwhich
    doggo
    erdtree
    jq
    mongodb-tools
    nmap
    pueue
    postgresql
    viddy
    yq
  ];
}
