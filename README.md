# Tauri + Vanilla + Nix and things

This template pulls together resources from a few different sources to provide a template for a Tauri project in Nix, initialized with vanilla HTML, CSS, and Javascript. 

Starting from the vanilla project generated by `create-tauri-app`, this also includes a Docker/Podman container for running `cargo tauri build` (recommended [here](https://github.com/tauri-apps/tauri/issues/3323#issuecomment-1199076500)), a `shell.nix` as suggested [here](https://tauri.app/v1/guides/getting-started/prerequisites#setting-up-linux) with a few small additions, and a `justfile` containing a few commands to get started.

This is by no means a reproducible setup, but it's good enough for me to start hacking on a personal project. I would be thrilled to see someone come along and develop something more robust!

Run `just --list` to see possible commands.

The AppImage generated by `just docker-build` does not seem to work with `appimage-run` on NixOS. There is an open Tauri issue on this [here](https://github.com/tauri-apps/tauri/issues/4930). This repo's `shell.nix` does bundle libthai so it should theoretically work, but I'm getting a different panic that "this application was not detected as an AppImage; this might be a security issue". Don't know what's up with that yet. 😬

Lastly, this assumes that rust and cargo are ready to use on your PATH. `shell.nix` will execute `cargo install tauri-cli` if it does not appear to be installed. 

## Recommended IDE Setup

- [VS Code](https://code.visualstudio.com/) + [Tauri](https://marketplace.visualstudio.com/items?itemName=tauri-apps.tauri-vscode) + [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)

(As recommended by `create-tauri-app`. Personally, I'm fond of [Doom Emacs](https://github.com/doomemacs/doomemacs)!)
