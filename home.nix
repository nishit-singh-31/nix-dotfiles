{ config, pkgs, userSettings, ... }:

{
  imports = [
    ./user/shell/sh.nix # bash config
    ./user/shell/cli-pkg.nix # CLI apps
    ./user/devel/lang.nix # Devel-env
    ./user/wm/hyprland.nix # Hyprland
    ./user/wm/waybar.nix # Waybar config
    #./user/wm/rofi/rofi.nix # Rofi config
    ./user/app/core.nix # Basic apps
    ./user/app/browser.nix # Mullvad config
    ./user/app/kitty.nix # Kitty config
    ./user/app/nvim/nvim.nix # Nvim config
    ./user/app/git.nix # git config
    ./user/games/an-anime-team.nix # AAGL, HSR, ZZZ install
  ];

  # User-info
  home.username = "nishit";
  home.homeDirectory = "/home/nishit";

  # Dont change
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  xdg.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
  };
}
