# This is the base for all machines that is managed and serviced by
# Break and Cassandra.

{ config, lib, pkgs, ... }:

{
  time.timeZone = lib.mkDefault "America/Los_Angeles";

  # Enable to use non-free packages such as nvidia drivers
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import ./overlays)
  ];

  # Override the default shell to zsh for chao
  users.extraUsers = lib.mkIf (config.vital.mainUser == "chao") {
    "chao" = {
      shell = lib.mkDefault pkgs.zsh;
      useDefaultShell = false;
    };
  };

  networking.enableIPv6 = true;

  environment.systemPackages = with pkgs; [
    gparted pass samba
  ] ++ lib.optionals config.vital.graphical.enable [
    feh
    jq
    google-chrome
    scrot
    # Move to desktop specific modules
    # zoom-us
    # thunderbird     
    # strawberry
    # audacious
    # audacity
    # steam-run-native
    # wesnoth
    # inkscape
    # discord
  ];
}
