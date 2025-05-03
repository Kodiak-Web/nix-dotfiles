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
      wl-clipboard
      waybar
      seahorse
      grimblast 
      wget
    ];
    file = {
      ".config/hypr/hyprland.conf".source = ./hyprland.conf;
      ".config/hypr/hyprlock.conf".source =  ./hyprlock.conf;
      ".config/hypr/hypridle.conf".source =  ./hypridle.conf;

      };
  };
}
