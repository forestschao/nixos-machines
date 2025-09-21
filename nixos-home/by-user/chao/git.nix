{ lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = lib.mkDefault pkgs.gitAndTools.gitFull;
    userName = lib.mkDefault "Chao Lin";
    userEmail = lib.mkDefault "forestschao@gmail.com";
    signing = {
      key = "forestschao@gmail.com";
      signByDefault = false;
    };
    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
      advice.addIgnoredFile = false;
    };
  };
}
