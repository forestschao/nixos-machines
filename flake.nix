{
  description = "Collection of my NixOS machines";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";

    # Use vital-modules, with the same nixpkgs
    vital-modules.url = "github:nixvital/vital-modules";
    vital-modules.inputs.nixpkgs.follows = "nixpkgs";

    # Use nixos-home, with the same nixpkgs
    nixos-home.url = "github:breakds/nixos-home";
    nixos-home.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, vital-modules, nixos-home, ... }: {
    nixosConfigurations = {
      samaritan = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          vital-modules.nixosModules.iphone-connect
          nixos-home.nixosModules.breakds-home
          ./machines/samaritan
        ];
      };
      
      gilgamesh = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          nixos-home.nixosModules.breakds-home
          ./machines/gilgamesh
        ];
      };

      rival = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          vital-modules.nixosModules.laptop-lids
          vital-modules.nixosModules.iphone-connect
          nixos-home.nixosModules.breakds-home-laptop
          ./machines/rival
        ];
      };

      zen = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          vital-modules.nixosModules.laptop-lids
          vital-modules.nixosModules.iphone-connect
          nixos-home.nixosModules.cassandra-home
          ./machines/zen
        ];
      };

      hardstone = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          nixos-home.nixosModules.breakds-home
          ./machines/hardstone
        ];
      };
    };
  };
}
