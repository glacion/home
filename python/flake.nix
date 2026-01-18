{
  description = "Python development environment";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          home.packages = with pkgs; [ (python3.withPackages (pkgs: with pkgs; [ uv ])) ];
          home.sessionPath = [ "$HOME/.local/bin" ];
        }
      );
    };
}
