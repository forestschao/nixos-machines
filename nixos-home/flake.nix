{
  description = "Chao's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # This creates a Home Manager config for the user "chao"
      homeConfigurations."chao" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # This points to the default.nix file you showed me earlier,
        # which contains all your settings and imports.
        modules = [ ./by-user/chao/default.nix ];
      };
    };
}
