# compile and run dev build locally
dev:
    cargo tauri dev

# build the release outputs (.deb and .AppImage)
docker-build:
    podman run --rm -it -v $(pwd):/usr/src/myapp $(podman build -q .)

clean:
   cargo clean --manifest-path src-tauri/Cargo.toml
