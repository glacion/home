{
  description = "Container configuration flake";
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
