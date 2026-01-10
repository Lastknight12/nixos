{ pkgs ? import <nixpkgs> {}, ... }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    nodePackages.npm
  ];

  shellHook = ''
    echo "Node.js development environment loaded!"
    echo "📦 Node: $(node --version)"
    echo "📜 NPM:  $(npm --version)"
  '';
}
