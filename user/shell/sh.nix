{ pkgs, ... }:

let

  # Shell aliases
  shAliases = {
    
    # hardware-cmd
    off = "shutdown now";
    rb = "reboot";
    bios = "sudo systemctl reboot --firmware-setup";
    wifi = "nmcli dev wifi list";
    wifi-con = "nmcli dev wifi connect";

    # peripheral-cmd
    bl = "brightnessctl set";

    # bluetooth
    dc-xbox = "bluetoothctl disconnect 0C:35:26:59:82:65"; # xbox-series-X-controller
    pair-major = "bluetoothctl connect 1C:6E:4C:92:11:36"; # marshall-major-IV
    dc-major = "bluetoothctl disconnect 1C:6E:4C:92:11:36"; # marshall-major-IV
    pair-kb = "bluetoothctl connect F4:73:35:A8:9C:D3"; # logitech-k380
    dc-kb = "bluetoothctl disconnect F4:73:35:A8:9C:D3"; # logitech-k380

    # sh-cmd
    ls = "ls --color=auto";
    ll = "ls -l";
    ".." = "cd ..";
    grep = "grep --color=auto";
    ff = "fastfetch";
    mnt = "bashmount";

    # sys-conf
    gconf = "sudo nvim /etc/default/grub";
    gmk = "sudo grub-mkconfig -o /boot/grub/grub.cfg";
    bashrc = "nvim ~/.dotfiles/user/shell/sh.nix";
    
    # nixOS-conf
    dot = "cd ~/.dotfiles";
    flk-up = "sudo nix flake update";
    sys-up = "sudo nixos-rebuild switch --flake .";
    hm-up = "home-manager switch --impure --flake .";
    gc = "nix-collect-garbage -d";
    
    # ricing-conf
    nvconf = "nvim ~/.config/nvim/init.lua";
  
  };

in

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = shAliases;
  };
}


