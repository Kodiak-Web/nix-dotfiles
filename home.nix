{ config, pkgs,lib, ... }:
let
   contentsOf = file: lib.strings.removeSuffix  "\n" (builtins.readFile file); #trailing newline causes issues
   usr = contentsOf ./user.name; 
   homedir = "/home/" + usr + "/";
in
{
  nixpkgs.config.allowUnfree = true; 
  home = {
    username = usr; 
    homeDirectory = homedir; 
    stateVersion = "24.05"; 
    packages = with pkgs; [
      cargo
      xclip
      fastfetch
      htop
      fzf
      fish
      neovim
      discord
      git
      xdotool
      winetricks
      babelfish
      wineWowPackages.stable
      keepassxc
      qbittorrent
      gimp
      playerctl
      spotify
      gh
      python312Packages.proton-keyring-linux
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
      #      (import (builtins.fetchTarball {
      #  url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
      #  sha256 = "1v9jk4j0zylx3ixwk5q8z22v6ir86pk9lfbf5q3ibgaggpf8kqa7";
      #})).an-anime-game-launcher #genshin impact.
      vimix-cursors
      bubblewrap
      dwarfs
      fuse-overlayfs
      ripgrep
      zig
      zls
      python3
    ];
    sessionVariables = {
      EDITOR = "nvim";
    };
  };
# Let Home Manager install and manage itself.

  programs.home-manager.enable = true;
}
