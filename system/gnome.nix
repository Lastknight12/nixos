{ pkgs, lib, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.open-bar
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.paperwm
  ];

  programs.dconf.profiles.user = {
    databases = [{
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          text-scaling-factor = 1.05;
        };
        
        "org/gnome/mutter" = {
          edge-tiling = true;
          dynamic-workspaces = true;
          experimental-features = ["scale-monitor-framebuffer"];
        };

        "org/gnome/desktop/background" = {
          picture-uri = "file:///etc/nixos/files/wallpaper.png";
          picture-uri-dark = "file:///etc/nixos/files/wallpaper.png";
        };
      };
    }];
  };
}
