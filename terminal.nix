{config,pkgs,...}:
  {
  home = {
    stateVersion = "24.05"; 
    packages = with pkgs; [
      kitty
      fish
      ripgrep
      fzf
      neovim
      git
      btop
      wget
      fastfetch
      xclip
      wl-clipboard
      gh
      bluetuith
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
