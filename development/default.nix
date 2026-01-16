{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.callPackage /etc/nixos/development/shell-picker {})
    pkgs.vscode
  ];

  environment.variables.DEV_SHELLS = "/etc/nixos/development/shells";
}
