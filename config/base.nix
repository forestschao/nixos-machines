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
    i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8" ];
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-rime           # Rime input method (supports Chinese)
        fcitx5-chinese-addons # Additional Chinese input methods
        fcitx5-configtool     # Configuration tool
        fcitx5-gtk            # GTK integration
      ];
    };

    environment.systemPackages = with pkgs; [
      librime
      rime-data
    ];

    # --- Services ---
    programs.steam.enable = true; #
    services.trezord.enable = true; #
    services.avahi.nssmdns4 = true; #
  };
}
