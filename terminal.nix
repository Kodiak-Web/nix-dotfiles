{config,pkgs,...}:
  {
  home = {
    stateVersion = "24.05"; 
    packages = with pkgs; [
      kitty
      fish
      zoxide
      ripgrep
      fzf
      neovim
      btop
      wget
      fastfetch
      xclip
      wl-clipboard
      bluetuith
      wiper
    ];
    sessionVariables = {
      EDITOR = "nvim";
      SHELL = "fish";
    };
    file  = {
      #"path/to/file".source = subfolder/file; #implicit ~/ in left hand side
    };
  };
}
