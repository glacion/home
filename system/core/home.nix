{ pkgs, ... }:
let
  isDarwin = pkgs.stdenv.isDarwin;
in
{
  home = {
    username = "glacion";
    homeDirectory = if isDarwin then "/Users/glacion" else "/home/glacion";
    stateVersion = "25.11";
    packages = [ ];
  };
}
