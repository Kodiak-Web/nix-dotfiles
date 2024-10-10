{config,pkgs,...}:
let
   contentsOf = file: builtins.readFile file;
   usr = contentsOf ./user.name; 
   homedir = "/home/" + usr + "/";
in
  {
  home = {
    username = usr; 
    homeDirectory = homedir; 
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
