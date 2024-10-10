#NOTE: add hyprland on a system level. when i add it through home-manager i haven't found a way to launch it.
{config,pkgs,lib,...}:
  {
  home = {
    stateVersion = "24.05"; 
    packages = with pkgs; [
      wofi #app launcher
      swaynotificationcenter
      kitty # terminal
      wl-clipboard
      waybar
      gnome.seahorse
      grimblast 
      wget
    ];
    file = {
      ".config/kitty/kitty.conf".source = ./dotfiles/kitty.conf;
      ".config/hypr/hyprland.conf".source = ./dotfiles/hyprland.conf;      
    };
  };
}
