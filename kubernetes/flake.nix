{
  description = "Kubernetes configuration flake";
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
