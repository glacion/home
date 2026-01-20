{
  description = "Cloud configuration flake";
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
