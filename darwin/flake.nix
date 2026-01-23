{
  description = "Darwin-specific configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          nixpkgs.config.allowUnfree = true;
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
      );
    };
}
