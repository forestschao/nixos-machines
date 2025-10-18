{ config, pkgs, lib, ... }:

{
  config = {
    # --- Shells & Editors ---
    programs.zsh.enable = true; #
    programs.bash.enableCompletion = true; #
    environment.variables.EDITOR = "vim"; #

    # --- System Packages ---
    environment.systemPackages = with pkgs;
      [
        # Desktop Packages
        i3-gaps #
        i3lock-fancy #
        feh #
        scrot #
        remmina #
        xclip #
        
        # Utility and Development Tools
        home-manager #
        gparted #
        jq #
        gitAndTools.gitFull #
        nixpkgs-review #
        pdftk #
        pv #
        dmidecode #
        sysstat #
        linuxPackages.perf #
        perf-tools #
        flamegraph #
        
        # Editors and related
        meld #
        tig #
        ledger #
        
        # Media and Graphics
        gimp #
        darktable #
        graphicsmagick #
        inkscape #
        ffmpeg #
        audacious #
        audacity #
        
        # Networking and File Transfer
        filezilla #
        axel #
        mullvad-vpn #
        google-chrome #
        
        # Virtualization/Boot
        woeusb #
        unetbootin #
        
        # Communication/Chat/Email
        zoom-us #
        thunderbird #
        element-desktop #
        
        # Security/Crypto
        trezor-suite #
        pass #
        
        # Server/Database/Web
        samba #
        hugo #
        quickserve #
        mysql-client #
        sqlitebrowser #
        awscli #
        python3Packages.tensorboard #
        
        # Programming/Math
        graphviz #
        sbcl #

        # Neovim with custom configuration
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
        }) #
      ];
  };
}
