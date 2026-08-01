{ myvar, ... }:
{
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
    };
    containers.registries.search = [
      "dockerproxy.net"
      "docker.1ms.run"
      "quay.io"
      "docker.io"
    ];
  };
  users.users."${myvar.username}" = {
    extraGroups = [
      "podman"
    ];
  };
}
