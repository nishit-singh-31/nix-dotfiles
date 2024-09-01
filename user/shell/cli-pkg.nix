{ pkgs, ... }:

{
  # CLI pkgs
  home.packages = with pkgs; [
    bashmount
    bluez bluez-tools bluez-alsa
    brightnessctl
    btop
    fastfetch
    liquidctl
    ranger
    unzip
    zip
  ];
}
