{
  description = "Development configuration flake";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ./home.nix
        ];
      };
    };
}
