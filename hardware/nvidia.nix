{ pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
  hardware.graphics.enable = true;
  hardware.nvidia.modesetting.enable = true;

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    #intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:05:0:0";
  };
}
