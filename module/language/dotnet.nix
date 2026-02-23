{ pkgs, ... }:
{
  home.packages = with pkgs; [
    csharpier
    dotnet-sdk_10
    icu
  ];

  home.sessionVariables = {
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
    DOTNET_NOLOGO = "1";
  };
  home.sessionPath = [
    "$HOME/.dotnet/tools"
  ];
}
