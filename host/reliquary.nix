{ ... }:
{
  system.stateVersion = "26.05";

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/ESP";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };
    "/mnt/storage" = {
      device = "/dev/disk/by-label/storage";
      fsType = "ext4";
    };
  };

  networking = {
    hostName = "reliquary";
    nameservers = [ "192.168.1.1" ];
  };

  services = {
    jellyfin.enable = true;
    openssh.enable = true;
    nginx = {
      enable = true;
      recommendedProxySettings = true;
      virtualHosts = {
        "jellyfin.glacion.com" = {
          locations."/" = {
            proxyPass = "http://127.0.0.1:8096";
            proxyWebsockets = true;
          };
        };
        "torrent.glacion.com" = {
          locations."/" = {
            proxyPass = "http://127.0.0.1:8080";
            proxyWebsockets = true;
          };
        };
      };
    };
    qbittorrent = {
      enable = true;
      webuiPort = 8080;
      openFirewall = true;
    };
    samba = {
      enable = true;
      openFirewall = true;
      settings = {
        global = {
          "netbios name" = "reliquary";
          "server string" = "reliquary";
          security = "user";
          workgroup = "WORKGROUP";
        };
        video = {
          "create mask" = "0644";
          "directory mask" = "0755";
          "force user" = "glacion";
          "guest ok" = "no";
          "read only" = "no";
          "valid users" = "glacion";
          browseable = "yes";
          path = "/mnt/storage/video";
        };
      };
    };
    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
  };

  systemd.network = {
    enable = true;
    networks.ethernet = {
      matchConfig.Name = "enp2s0f1";
      DHCP = "no";
      address = [ "192.168.1.3/24" ];
      gateway = [ "192.168.1.1" ];
    };
  };

  users.users.glacion = {
    extraGroups = [ "wheel" ];
  };
}
