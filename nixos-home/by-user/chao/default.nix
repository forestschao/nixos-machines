{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./xsession.nix
  ];
  home.username = "chao";
  home.homeDirectory = "/home/chao";
  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
  [
    roboto-mono
    font-awesome
    fira-code-nerdfont
    graphviz
    neofetch
    graphicsmagick
    ffmpeg
  ];

  # Environment variables for input method
  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv = {
      enable = true;
    };
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions;
    [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
    ];
  };
  
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "pass"     # pass store auto-completion
        "dotenv"
        "extract"  # decompression general command
        "z"
      ];
    };

    plugins = [
      {
        # will source nix-zsh-completions.plugin.zsh
        name = "nix-zsh-completions";
        src = pkgs.fetchFromGitHub {
          owner = "spwhitt";
          repo = "nix-zsh-completions";
          rev = "0.4.4";
          sha256 = "sha256-Djs1oOnzeVAUMrZObNLZ8/5zD7DjW3YK42SWpD2FPNk=";
        };
      }
    ];
    initExtra = ''
      # Setting up direnv.
      # Actually I am not entirely sure this is needed now.
      if [ -x "$(command -v direnv)" ];
      then
        eval "$(direnv hook zsh)"
      fi
    '';
  };
}
