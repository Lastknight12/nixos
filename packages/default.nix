{ pkgs, ...}:

{
  imports = [
    ./dev.nix
  ];

  environment.systemPackages = with pkgs; [ 
    discord 
    telegram-desktop
    neofetch
    obs-studio
    pavucontrol
  ];
}
