{ pkgs ? import <nixpkgs> {} }:

pkgs.rustPlatform.buildRustPackage {
  pname = "dev";
  version = "0.1.0";

  src = ./.;

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  meta = {
    description = "Interactive nix-shell selector";
    platforms = pkgs.lib.platforms.linux;
  };
}
