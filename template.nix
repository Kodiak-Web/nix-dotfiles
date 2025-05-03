{config,pkgs,...}:
  {
  home = {
    stateVersion = "24.05"; 
    packages = with pkgs; [
      #list
      #of 
      #packages 
      #here
    ];
    file  = {
      #"path/to/file".source = subfolder/file; #implicit ~/ in left hand side
    };
  };
};
