{ config, pkgs, ... }:

let
  aagl-gtk-on-nix = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz");
in
{
  home.packages = with pkgs; [
    aagl-gtk-on-nix.anime-game-launcher
    aagl-gtk-on-nix.honkers-railway-launcher
    aagl-gtk-on-nix.sleepy-launcher
  ];
}
