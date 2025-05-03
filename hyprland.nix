#NOTE: add hyprland on a system level. when i add it through home-manager i haven't found a way to launch it.
{config,pkgs,lib,...}:
  {
  home = {
    stateVersion = "24.05"; 
    packages = with pkgs; [
      wofi #app launcher
      # hyprlock #doesn't work unless installed systemwide
      hypridle
      swaynotificationcenter
      kitty # terminal
      wl-clipboard
      waybar
      seahorse
      grimblast 
      wget
    ];
    file = {
      ".config/kitty/kitty.conf".source = ./dotfiles/kitty.conf;
      ".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
      ".config/hypr/hyprlock.conf".source =  ./dotfiles/hypr/hyprlock.conf;
      ".config/hypr/hypridle.conf".source =  ./dotfiles/hypr/hypridle.conf;

      };
  };
}
