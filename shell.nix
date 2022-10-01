# From https://tauri.app/v1/guides/getting-started/prerequisites#setting-up-linux
# Modified to include cargo and rustc packages

let
  pkgs = import <nixpkgs> { };

  libraries = with pkgs;[
    webkitgtk
    gtk3
    cairo
    gdk-pixbuf
    glib.out
    dbus.lib
    openssl_3.out

    # added this for https://github.com/tauri-apps/tauri/issues/4930
    libthai
  ];

  packages = with pkgs; [
    pkg-config
    dbus
    openssl_3
    glib
    gtk3
    libsoup
    webkitgtk
    appimagekit

    # added these as necessary dependencies
    cargo
    rustc

    # personal additions
    just
  ];
in
pkgs.mkShell {
  buildInputs = packages;

  shellHook =
    let
      joinLibs = libs: builtins.concatStringsSep ":" (builtins.map (x: "${x}/lib") libs);
      libs = joinLibs libraries;
    in
    ''
      export LD_LIBRARY_PATH=${libs}:$LD_LIBRARY_PATH
      # install tauri if not already installed
      cargo help tauri 2> /dev/null 1> /dev/null || cargo install tauri-cli
    '';
}
