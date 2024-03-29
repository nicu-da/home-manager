{
  description = "Home Manager configuration of nicu";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
        url = "github:nix-community/nixvim";
        inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."nicu" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; 

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
            ./home.nix 
            ./tmux.nix 
            ./fzf.nix 
            ./fish.nix 
            ./starship.nix 
            ./direnv.nix 
            ./nvim.nix 

            nixvim.homeManagerModules.nixvim
       ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
