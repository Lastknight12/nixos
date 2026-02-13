{ pkgs, ... }:

{
  imports = [
    ./steam.nix
    ./supergfxd.nix
    ./firefox.nix
    ./git.nix
    ./docker.nix
    ./zsh.nix
    ./devbox.nix
    ./flatpak.nix
  ];

  environment.systemPackages = with pkgs; [ 
    discord 
    telegram-desktop
    neofetch
    pavucontrol
    htop
    vscode
  ];
}