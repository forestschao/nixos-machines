{ lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../base
    ../../base/i3-session-breakds.nix
    ../../base/dev/breakds-dev.nix
    ../../base/dev/vim.nix
  ];

  config = {
    vital.mainUser = "chao";

    users.users."chao" = {
      openssh.authorizedKeys.keyFiles = [
        ../../data/keys/chao.pub
      ];
    };

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";

    # Internationalisation
    i18n.defaultLocale = "en_US.utf8";

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # networking = {
      # hostName = "samaritan";
      # Generated via `head -c 8 /etc/machine-id`
      # hostId = "9c4a63a8";

      # WakeOnLan. You will need to know the ip and mac of this
      # machines to be able to wake it. The command that you should
      # run on the other machine should be:
      #
      #     wol -i <ip> <mac>
      # interfaces."enp6s0".wakeOnLan.enable = true;
    # };
    nixpkgs.config.permittedInsecurePackages = [
      "python3.10-poetry-1.2.2"
      "python3.10-certifi-2022.9.24"
    ];

    vital.graphical = {
      enable = true;
      remote-desktop.enable = true;
      nvidia.enable = true;
      xserver.dpi = 120;
    };

    vital.pre-installed.level = 5;
    vital.games.steam.enable = true;
    vital.programs.texlive.enable = true;
    vital.programs.modern-utils.enable = true;
    vital.programs.accounting.enable = true;
    vital.programs.machine-learning.enable = false;
    
    environment.systemPackages = with pkgs; [
      gimp
      darktable
      filezilla
      woeusb
      axel
      audacious
      audacity
      zoom-us
      thunderbird
      mullvad-vpn
      unetbootin
      trezor-suite
      inkscape
      element-desktop
      xclip
    ];

    # Trezor cryptocurrency hardware wallet
    services.trezord.enable = true;

    # Disable unified cgroup hierarchy (cgroups v2)
    # This is to applease nvidia-docker
    systemd.enableUnifiedCgroupHierarchy = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.05"; # Did you read the comment?
    home-manager.users."chao".home.stateVersion = "22.05";
  };
}
