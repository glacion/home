{ ... }:
{
  system.stateVersion = "26.05";
  services.openssh.enable = true;

  networking = {
    hostName = "aegis";
    nameservers = [ "192.168.1.1" ];
  };

  systemd.network = {
    enable = true;
    networks.ethernet = {
      matchConfig.Name = "end0";
      DHCP = "no";
      address = [ "192.168.1.2/24" ];
      gateway = [ "192.168.1.1" ];
    };
  };

  users.users.glacion = {
    extraGroups = [ "wheel" ];
  };
}
