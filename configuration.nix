{ config, pkgs, lib, ... }:

{
  imports = [
    # Base system
    ./hardware-configuration.nix
    ./config/base.nix
    ./config/boot.nix
    ./config/user.nix
    
    # Desktop environment
    ./config/desktop.nix
    ./config/sound.nix

    # Applications and packages
    ./config/packages.nix
  ];

  config = {
    system.stateVersion = "23.11"; #
  };
}
