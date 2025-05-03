# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  # boot.loader = {
  #   efi.canTouchEfiVariables = true;
  #   grub = {
  #     enable = true;
  #     devices = [ "nodev" ];
  #     efiSupport = true;
  #     useOSProber = true;
  #     timeout = 30;
  #     gfxmodeEfi = "1280x800";
  #     extraConfig = "set timeout = 30";
  #     };
  # };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";
  time.timeZone = "America/Los_Angeles";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
    # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    enable = true;
    videoDrivers = [ "amdgpu" ];
    displayManager.lightdm.enable = false; #for some reason, doesn't like launching hyprland. don't care enough to find out why, launching through term is fine.
    desktopManager.cinnamon.enable = true;
    windowManager.i3.enable = true;
    };

  # OR
  hardware = {
    opengl.driSupport32Bit = true;
    pulseaudio.enable = false;
  };
   services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
   };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  users.users.unauthenticated = {
    isNormalUser = true;
    description = "unauthenticated";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [fish];
    shell = pkgs.fish;
  };
  # List packages installed in system profile. To search, run:
  # users.users.gabe = {
  #   isNormalUser = true;
  #   description = "gabe";
  #   extraGroups = [ "networkmanager" "wheel" ];
  # };
  
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # List packages installed in system profile. To search, run:
  # $ nix search wget 
  environment.systemPackages = with pkgs; [

    nerd-fonts.fira-code
    hyprlock #for some reason doesn't work when installed through home-manager
    zfs
    protonvpn-gui
    neovim
    google-chrome
    gnome-keyring
    cachix
    joycond
    ntfs3g
    faudio #fix proton ERR
    prismlauncher
  ];
  # Install firefox.
  programs.firefox.enable = true;
  programs.fish.enable = true; 
  services.flatpak.enable = true;
  programs.steam.enable = true;
  programs.hyprland.enable = true;
  programs.firefox.nativeMessagingHosts.packages = [
      pkgs.tridactyl-native # doesn't work either
    ];
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    fuse3
    icu
    nss
    openssl
    curl
    expat
    # ...
  ];
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
hardware.opengl.enable = true;

boot.initrd.kernelModules = [ "amdgpu" ];






#fix proton ERR
services.pipewire.extraConfig.pipewire."default" = {
	 "context.properties" = {
	 "default.clock.rate"  = "192000";
	 };
};



 system.stateVersion = "24.05"; # Did you read the comment?
}
