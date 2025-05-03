{config,pkgs,...}:
{
  home = {
    stateVersion = "24.05"; 
    packages = with pkgs; [
      git
      gh
      cmake 
      ninja
    ];
    # file  = {    };
  };
}
