{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mtr
    iperf3
    dnsutils
    ldns
    curl
    wget
    aria2
    socat
    nmap
    ipcalc
  ];
}
