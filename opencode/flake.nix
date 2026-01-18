{
  description = "Opencode installation via bun";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, lib, ... }:
        {
          home.packages = with pkgs; [ bun ];
          home.sessionPath = [ "$HOME/.bun/bin" ];
          home.activation.installOpencode = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            ${pkgs.bun}/bin/bun install -g opencode-ai > /dev/null 2>&1
          '';
        }
      );
    };
}
