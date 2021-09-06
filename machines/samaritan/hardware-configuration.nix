# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a919448b-2382-4967-8150-952c7101a339";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/60eee176-8d1f-498b-9ad7-37df8b0a1776";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3ECC-0127";
      fsType = "vfat";
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/bb0689ba-5d0b-4f64-a904-6ae9be66104f";
      fsType = "ext4";
    };

  fileSystems."/var/lib/wonder/warehouse" =
    { device = "/dev/disk/by-label/WONDER_WAREHOUSE";
      fsType = "ext4";
      # Do not block booting if the disck is missing
      options = [ "auto" "nofail" ];
    };

  fileSystems."/home/breakds/dataset" =
    { device = "/dev/disk/by-uuid/4aa61fc7-9776-4338-98ce-07fbf8fda9ef";
      fsType = "ext4";
      options = [ "auto" "nofail" ];
    };

  fileSystems."/home/breakds/.local" =
    { device = "/dev/disk/by-uuid/c61704d8-f228-4fdc-9864-544f96882a06";
      fsType = "ext4";
      options = [ "auto" "nofail" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/4d4162a1-9161-4535-8ab1-2f01e779a7bf"; }
    ];

  nix.maxJobs = lib.mkDefault 20;
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  # High-DPI console
  console.font = lib.mkDefault "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
}
