{ config, pkgs, lib, ... }:

{
  options.programs.bash.completion = lib.mkOption {
    type = lib.types.submoduleWith { modules = [ ]; };
    default = { enable = false; }; #
    description = "Compatibility shim for old bash completion option.";
    internal = true;
  };

  config = {
    # --- User Configuration ---
    users.users."chao" = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keyFiles = [
        ../data/keys/chao.pub
      ];
    };

    # --- Home Manager ---
    home-manager.users."chao" = import ../nixos-home/by-user/chao/default.nix;
  };
}
