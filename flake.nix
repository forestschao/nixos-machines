{
  description = "NixOS configuration for 'foundation' machine";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  # 'nixos-home' is removed from the function arguments
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.foundation = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # 1. This is your main configuration file
        ./configuration.nix

        # 2. This imports the NixOS module from home-manager,
        #    which allows 'home-manager.users' to work.
        home-manager.nixosModules.default
      ];
    };
  };
}
