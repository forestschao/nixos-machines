# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "megaraid_sas" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/152b7d6e-dfa1-46bd-ab50-14add186ad85";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5960-EE5B";
      fsType = "vfat";
    };

  # For NAS
  fileSystems."/var/lib/filerun" =
    { device = "/dev/disk/by-uuid/f98819aa-cd1b-40de-b0b1-371344da8a18";
      fsType = "ext4";
      # Do not panic and continue to boot if this disk is missing.
      options = [ "auto" "nofail" ];      
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/f77f84ac-4a9f-4cbf-9a4f-720a229dcae2"; }
    ];

  nix.maxJobs = lib.mkDefault 28;
}
