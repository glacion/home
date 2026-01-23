{ pkgs, ... }:
{
  home.packages = with pkgs; [
    awscli2
    (google-cloud-sdk.withExtraComponents (with google-cloud-sdk.components; [
      gke-gcloud-auth-plugin
    ]))
    opentofu
    cloudflared
  ];
}
