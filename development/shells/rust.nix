{ pkgs ? import <nixpkgs> {} }:

let
  rustSrc = pkgs.rust.packages.stable.rustPlatform.rustLibSrc;
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    openssl
    rustc
    cargo
    gcc
    rustfmt
    clippy
    pkg-config
  ];

  shellHook = ''
    export RUST_SRC_PATH=${rustSrc}

    echo "Rust development environment loaded!"
    echo "🦀 Rust: $(rustc --version)"
    echo "📦 Cargo:   $(cargo --version)"
    echo "🛠️ Compiler: $(gcc --version | head -n 1)"
  '';
}