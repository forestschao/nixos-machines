{ config, pkgs, lib, ... }:

{
  # 1. IMPORTS
  imports = [
    ./hardware-configuration.nix
  ];

  # 2. OPTIONS
  options.programs.bash.completion = lib.mkOption {
    type = lib.types.submoduleWith { modules = [ ]; };
    default = { enable = false; };
    description = "Compatibility shim for old bash completion option.";
    internal = true;
  };

  # 3. CONFIG
  config = {
    system.stateVersion = "23.11";

    # --- Base System Settings ---
    time.timeZone = "America/Los_Angeles";
    networking.enableIPv6 = true;
    nixpkgs.config.allowUnfree = true;

    # --- Nix Settings ---
    programs.nix-ld.enable = true;
    programs.sysdig.enable = true;
    nix.extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';

    # --- Bootloader ---
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";

    # --- User Configuration ---
    # This just defines the system user 'chao'
    users.users."chao" = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keyFiles = [
        ./data/keys/chao.pub
      ];
    };

    # --- Home Manager ---
    # This tells Home Manager to build the 'chao' user
    # by importing the file from your flattened 'nixos-home' directory.
    # This is the main fix.
    home-manager.users."chao" = import ./nixos-home/by-user/chao/default.nix;
    
    # --- Sound (PipeWire) ---
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # --- Graphical Interface (X11, i3, NVIDIA) ---
    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      windowManager.i3.enable = true;
      videoDrivers = [ "nvidia" ];
    };

    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # --- Internationalisation ---
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-chinese-addons
      ];
    };

    # --- Services ---
    programs.steam.enable = true;
    services.trezord.enable = true;
    services.avahi.nssmdns4 = true;

    # --- Shells & Editors ---
    programs.zsh.enable = true;
    programs.bash.enableCompletion = true;
    environment.variables.EDITOR = "vim";

    # --- System Packages ---
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
      home-manager
      gparted
      pass
      samba
      feh
      jq
      google-chrome
      scrot
      meld
      tig
      gitAndTools.gitFull
      nixpkgs-review
      ledger
      graphviz
      graphicsmagick
      pdftk
      hugo
      quickserve
      remmina
      ffmpeg
      mysql-client
      sqlitebrowser
      awscli
      python3Packages.tensorboard
      pv # pipe viewer
      dmidecode
      sbcl
      sysstat
      linuxPackages.perf
      perf-tools
      flamegraph

      # Your neovim config
      (neovim.override {
        vimAlias = true;
        configure = {
          packages.myPlugins = with pkgs.vimPlugins; {
            start = [
              vim-lastplace vim-nix
              vim-airline vim-airline-themes
              vim-colors-solarized
              vim-autoformat
            ];
            opt = [];
          };
          customRC = ''
            " Use Vim settings, rather than Vi Settings
            set nocompatible
            " General settings
            set backspace=indent,eol,start
            set ruler
            set number
            set showcmd
            set tabstop=2
            set shiftwidth=2
            set expandtab
            set clipboard+=unnamedplus
            set incsearch
            set hlsearch
            set ic
            set history=200
            set mouse=a
            " Turnoff the highlight
            nnoremap \ :noh<return>
            " Solarized-dark colorscheme
            let g:solarized_termcolors=256
            set t_Co=256
            syntax enable
            set background=dark
            colorscheme solarized
            
            " Use the solarized theme for the Airline status bar
            let g:airline_theme='solarized'
          '';
        };
      })
    ];
  };
}
