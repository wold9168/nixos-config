{
  ...
}:
{
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  # KMS
  hardware.nvidia.modesetting.enable = true;

  # Suspend
  hardware.nvidia.powerManagement.enable = true;
}
