{
    description = "NixOS from Scratch";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: {
        nixosConfigurations.nikhil-nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                hyprland.nixosModules.default
                ./configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.nikhil = import ./home.nix;
                        backupFileExtension = "backup";
                        extraSpecialArgs = { inherit inputs; };
                    };
                }
            ];
        };
    };
}
