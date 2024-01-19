{
  description = "Nix flake and git test";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = rec {
          default = pkgs.writeText "git-commit-hash" "${self.rev}";
        };
      }
    );
}

