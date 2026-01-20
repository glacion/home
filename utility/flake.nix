{
  description = "Utility configuration flake";
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
