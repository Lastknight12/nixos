{ pkgs, ... }:

{
  imports = [
    ./steam.nix
    ./supergfxd.nix
    ./firefox.nix
    ./git.nix
    ./docker.nix
    ./zsh.nix
  ];

  environment.systemPackages = with pkgs; [ 
    discord 
    telegram-desktop
    neofetch
    obs-studio
    pavucontrol
    htop
  ];
}