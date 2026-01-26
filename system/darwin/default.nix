{ pkgs, ... }: {
  home.packages = with pkgs; [
    coreutils
    findutils
    gnused
    gnugrep
    gnutar
    colima
    gnupg
  ];
}
