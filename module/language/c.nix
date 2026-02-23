{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    clang-tools
    cmake
    gdb
    gcc
    gnumake
    pkg-config
    valgrind
  ];

  home.sessionVariables = {
    LD_LIBRARY_PATH = lib.makeLibraryPath [ pkgs.stdenv.cc.cc ];
  };
}