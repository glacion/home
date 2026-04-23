{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    clang-tools
    cmake
    gcc
    gnumake
    pkg-config
  ];

  home.sessionVariables = {
    LD_LIBRARY_PATH = lib.makeLibraryPath [ pkgs.stdenv.cc.cc ];
  };
}
