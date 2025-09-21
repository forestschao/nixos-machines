{ config, pkgs, ... }:

{
  config = {
    users.users."chao" = {
      isNormalUser = true;
      uid = 1000;
      shell = pkgs.zsh;
      useDefaultShell = false;
    };
  };
}
