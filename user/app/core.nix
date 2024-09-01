{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vesktop
    bitwarden-desktop
    polychromatic
    libreoffice-qt-fresh
  ];
}
