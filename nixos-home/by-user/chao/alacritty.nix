# alacritty.nix
{ pkgs, ... }:

let
  draculaColorTheme = {
    primary = {
      background = "#282a36";
      foreground = "#f8f8f2";
    };
    normal = {
      black   = "#000000";
      red     = "#ff5555";
      green   = "#50fa7b";
      yellow  = "#f1fa8c";
      blue    = "#bd93f9";
      magenta = "#ff79c6";
      cyan    = "#8be9fd";
      white   = "#bfbfbf";
    };
    bright = {
      black   = "#575b70";
      red     = "#ff6e67";
      green   = "#5af78e";
      yellow  = "#f4f99d";
      blue    = "#caa9fa";
      magenta = "#ff92d0";
      cyan    = "#9aedfe";
      white   = "#e6e6e6";
    };
  };
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      # Merge your theme with the draw_bold_text_with_bright_colors setting
      colors = draculaColorTheme // {
        draw_bold_text_with_bright_colors = true;
      };

      # Other settings
      font = {
        size = 12;
        normal.family = "FiraCode Nerd Font";
      };
      window.opacity = 0.95;
    };
  };
}
