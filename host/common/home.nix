{ inputs, hostname, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs hostname;
    };
    users.glacion =
      { pkgs, ... }:
      {
        imports = [
          ../../module/core
          ../../module/shell
          ../../module/development
          ../../module/language
          ../../module/nvim
          ../../module/opencode
        ];

        home = {
          username = "glacion";
          homeDirectory = if pkgs.stdenv.isDarwin then "/Users/glacion" else "/home/glacion";
          stateVersion = "26.05";
        };
      };
  };
}
