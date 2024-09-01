{ inputs, pkgs, lib, ... }:

{
  imports = [
    ./pipewire.nix
    ./dbus.nix
    ./wayland.nix
  ];
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver.excludePackages = [ pkgs.xterm ];
}


