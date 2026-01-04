{ pkgs, ... }:

{ 
  environment.systemPackages = with pkgs; [ 
    vscode
    nodejs
  ];
}
