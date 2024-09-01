{ config, lib, pkgs, systemSettings, userSettings, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./system/hardware/kernel.nix # kernel config
      ./system/hardware/power.nix # tlp config
      ./system/hardware/time.nix # time-sync
      ./system/hardware/opengl.nix 
      ./system/hardware/bluetooth.nix
      ./system/hardware/printing.nix
      ./system/wm/dbus.nix
      ./system/wm/fonts.nix
      ./system/wm/hyprland.nix
      ./system/wm/pipewire.nix
      ./system/wm/wayland.nix
      ./system/app/steam.nix
      ./system/app/gamemode.nix
    ];

  # Nix-daemon trust config
  nix.settings.allowed-users = [
    "@wheel"
    "nishit"
  ];
  nix.settings.trusted-users = [ 
    "@wheel"
  ];

  # Nix-pkgs
  nixpkgs.config.allowUnfree = true;

  # Bootloader (systemd-boot if uefi, else grub)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Timezone and locale
   time.timeZone = "Asia/Kolkata";
   fonts.fontDir.enable = true;
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus16";
   };

  # User-account
   users.users.nishit = {
     isNormalUser = true;
     home = "/home/nishit";
     extraGroups = [ "wheel" ]; 
   };

  # Sys-pkgs
   environment.systemPackages = with pkgs; [
    wget
    git
   ];

  # an-anime-team
    nix.settings = {
    substituters = [ "https://ezkea.cachix.org" ];
    trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
    };

  # Desktop-portal
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
    };

  # Never change this
  system.stateVersion = "24.05"; 

  # Nix-flakes
  nix.package = pkgs.nixFlakes;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.overlays = [ (_: prev: { stdenv = prev.stdenv // { inherit (prev) lib; }; }) ];
}

