{ pkgs, ... }:

{
   environment.variables = {
    DEV_SHELLS = "/etc/nixos/development/shells";
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "node-shell" ''
      nix-shell /etc/nixos/development/shells/node.nix
    '')
    (pkgs.writeShellScriptBin "rs-shell" ''
      nix-shell /etc/nixos/development/shells/rust.nix
    '')
  ];
}
