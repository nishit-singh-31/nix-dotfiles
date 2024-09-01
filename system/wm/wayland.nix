{ config, pkgs, ... }:

{
  imports = [
    ./pipewire.nix
    ./dbus.nix
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
  wayland waydroid
  ];
}
