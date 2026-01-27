{ pkgs, ... }:
{
  home = {
    username = "glacion";
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/glacion" else "/home/glacion";
    stateVersion = "25.11";
  };
}
