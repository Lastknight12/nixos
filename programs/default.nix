{ pkgs, config, ... }:

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

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [ 
    discord 
    telegram-desktop
    neofetch
    pavucontrol
    htop
    vscode
  ];
}