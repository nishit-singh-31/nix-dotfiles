{

  description = "flake-1";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland = {
      type = "git";
      url = "https://code.hyprland.org/hyprwm/Hyprland.git";
      submodules = true;
      inputs.nixpkgs.follows = "nixpkgs";

    };

  };

  outputs = inputs@{ self, ... }:
    let
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system = "x86_64-linux";
	bootMode = "uefi";
	bootMountPath = "/boot";
	grubDevice = "";
	gpuType = "intel";
      };

      # ---- USER SETTINGS ---- #
      userSettings = {
        username = "nishit";
	name = "nishit";
	email = "nishitsingh_31@protonmail.com"; # email required for git
	dotfilesDir = "~/.dotfiles"; # path for the local repo
	theme = "gruvbox"; # selected theme from ./themes/
	wm = "hyprland"; # selected window manager (must be present in both ./user/wm and ./system/wm)
	wmType = "wayland";
	term = "kitty"; # set default terminal
	font = "monospace"; 
	editor = "neovim"; # set default editor
      };

      lib = inputs.nixpkgs.lib;

      pkgs = inputs.nixpkgs.legacyPackages.${systemSettings.system};
      
      home-manager = inputs.home-manager;

    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = "x86_64-linux";
	modules = [ ./configuration.nix ];
	specialArgs = {
          inherit systemSettings;
	  inherit userSettings;
	  inherit inputs;
	};
      };
    };

    homeConfigurations = {
      nishit = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	modules = [ ./home.nix ];
	extraSpecialArgs = {
	  inherit systemSettings;
	  inherit userSettings;
	  inherit inputs;
	};
      };
    };
  };

}
