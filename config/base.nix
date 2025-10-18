{ config, pkgs, lib, ... }:

{
  config = {
    # --- Base System Settings ---
    time.timeZone = "America/Los_Angeles";
    networking.enableIPv6 = true;
    nixpkgs.config.allowUnfree = true;

    # --- Nix Settings ---
    programs.nix-ld.enable = true;
    programs.sysdig.enable = true;
    nix.extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';

    # --- Internationalisation ---
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs;
        [
          fcitx5-chinese-addons
        ];
    };

    # --- Services ---
    programs.steam.enable = true; #
    services.trezord.enable = true; #
    services.avahi.nssmdns4 = true; #
  };
}
