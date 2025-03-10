# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/4fa202de-50a4-44ab-99f8-1d1ee2d6b3a1";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/A0C5-5BE5";
      fsType = "vfat";
    };

  fileSystems."/home" = {
    device = "/dev/disk/by-label/BDS_HOME";
    fsType = "ext4";
  };

  fileSystems."/home/breakds/backup" = {
    device = "/dev/disk/by-label/BDS_BACKUP";
    fsType = "ext4";
    options = [ "auto" "nofail" ];
  };

  fileSystems."/var/lib/filerun" = {
    device = "/dev/disk/by-label/NAS_DATA";
    fsType = "ext4";
    options = [ "auto" "nofail" ];
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp9s0.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
