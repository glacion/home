{
  description = "Core user configuration flake";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ./home.nix
          ./program.nix
        ];
      };
    };
}
