{
  description = "Home Manager Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dolphin-emu-nix.url = "github:matthewcroughan/dolphin-emu-nix";
  };
  outputs = {nixpkgs, home-manager, dolphin-emu-nix, ...}: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;

    homeConfigurations = {
      "unauthenticated" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        modules = [
          ./terminal.nix
          ./home.nix 
          ./hyprland.nix
          ./gaming.nix
          ./devel.nix
          {
          home.packages = [
            dolphin-emu-nix.packages.x86_64-linux.dolphin-emu
          ];
        }
        ]; 
      };
    };
  };
}
