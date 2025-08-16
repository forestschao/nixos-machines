{ config, pkgs, ... }:

{
  # Import other parts of your configuration
  imports = [
    ./hardware-configuration.nix
    ../../base
    ../../base/i3-session-breakds.nix # Assumed to be your custom i3 setup
    ../../base/dev/breakds-dev.nix
    ../../base/dev/vim.nix
  ];

  # Allow proprietary software. This is required for Steam and Nvidia drivers.
  nixpkgs.config.allowUnfree = true;

  # --- User Configuration ---
  vital.mainUser = "chao"; # From your custom framework

  users.users."chao" = {
    openssh.authorizedKeys.keyFiles = [
      ../../data/keys/chao.pub
    ];
  };

  # --- Bootloader ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # --- Internationalisation ---
  i18n.defaultLocale = "en_US.utf8";

  # --- Sound ---
  # Enable sound with PipeWire instead of PulseAudio.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # --- Graphical Interface (X11) and i3 Window Manager ---
  # Standard NixOS configuration for a graphical session with the i3 window manager.
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true; # A lightweight display manager
    windowManager.i3.enable = true;       # Enable i3 window manager
  };

  # Your custom graphical settings
  vital.graphical = {
    enable = true;
    remote-desktop.enable = true;
    nvidia.enable = true;
    xserver.dpi = 120;
  };

  # --- Gaming ---
  # Enable Steam. `allowUnfree` must be true for this to work.
  programs.steam.enable = true;
  vital.games.steam.enable = true; # From your custom framework

  # --- System Packages ---
  # List of packages to be installed system-wide.
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

  # --- Services ---
  # Enable Trezor hardware wallet daemon.
  services.trezord.enable = true;

  # --- Systemd and Docker Compatibility ---
  # Disable unified cgroup hierarchy (cgroups v2).
  # Note: This is often for compatibility with older container tools.
  # Consider removing this if you don't specifically need it.
  systemd.enableUnifiedCgroupHierarchy = false;

  # --- Your Custom Framework Options ---
  vital.pre-installed.level = 5;
  vital.programs.texlive.enable = true;
  vital.programs.modern-utils.enable = true;
  vital.programs.accounting.enable = true;
  vital.programs.machine-learning.enable = false;

  # --- State Version ---
  # It is VERY important to read the NixOS release notes before changing this value.
  # It manages state locations and database schemas between releases.
  # Upgraded from 22.05 to 23.11 for more modern defaults.
  system.stateVersion = "23.11";
  home-manager.users."chao".home.stateVersion = "23.11";
}
