{ config, pkgs, lib, ... }:

{
  config = {
    # --- Graphical Interface (X11, i3, NVIDIA) ---
    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      videoDrivers = [ "nvidia" ];

      desktopManager.session = [
        {
          name = "home-manager";
          start = ''
            ${pkgs.runtimeShell} $HOME/.hm-xsession &
            waitPID=$!
          '';
        }
      ];
    };

    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
