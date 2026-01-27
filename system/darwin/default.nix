{ pkgs, ... }: {
  home.packages = with pkgs; [
    colima
    coreutils
    findutils
    gnugrep
    gnupg
    gnused
    gnutar
  ];
}
