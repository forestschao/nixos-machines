# This file contains workarounds for issues found in external dependencies.

{ lib, config, ... }:

{
  # WORKAROUND: An external flake (likely vital-modules or nixos-home)
  # is using the old `programs.bash.completion` option, which was removed
  # in newer NixOS versions.
  #
  # This creates a dummy "shim" option to absorb the old setting from the
  # dependency, preventing a build failure.
  options.programs.bash.completion = lib.mkOption {
    type = lib.types.submoduleWith { modules = [ ]; };
    default = { enable = false; };
    description = "Compatibility shim to ignore old bash completion option from a dependency.";
    internal = true; # Hides this dummy option from documentation.
  };

  # CORRECTED: All system settings must be inside the 'config' attribute
  # when 'options' is also defined at the top level of a module.
  config = {
    # Now, we can safely set the NEW, correct option for bash completion.
    # This ensures the feature is actually enabled on your system.
    programs.bash.enableCompletion = true;

    # Set the NEW, correct option for Avahi mDNS. This enables hostname
    # resolution for devices on the local network.
    services.avahi.nssmdns4= true;
  };
}

