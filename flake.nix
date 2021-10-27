{
  description = "The Marlowe website";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs.url= "github:NixOS/nixpkgs?ref=nixpkgs-unstable";

    gitignore-nix.url = "github:hercules-ci/gitignore.nix";

    npmlock2nix = {
      url = "github:tweag/npmlock2nix";
      flake = false;
    };
  };

  outputs = { self, flake-utils, nixpkgs, npmlock2nix, gitignore-nix }:
  flake-utils.lib.simpleFlake {
    inherit self nixpkgs;

    name = "marlowe-website";

    preOverlays = [ gitignore-nix.overlay ];

    overlay = final: prev: let
      npmlock2nix-build = (final.callPackage npmlock2nix { }).build;
    in {
      marlowe-website.defaultPackage = npmlock2nix-build {
        src = final.gitignoreSource ./.;
        installPhase = "cp -r public $out";
        node_modules_mode = "copy";

        node_modules_attrs = {
          packageLockJson = ./package-lock.json;
          packageJson = ./package.json;
        };
      };
    };
  };
}
