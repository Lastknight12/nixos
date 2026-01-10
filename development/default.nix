{ pkgs, ... }:

{
  imports = [
    ./shells
  ];

  environment.systemPackages = with pkgs; [ 
    vscode
  ];
}
