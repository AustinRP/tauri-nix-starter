FROM rust:1.64

WORKDIR /usr/src/myapp

RUN cargo install tauri-cli
RUN apt-get update && apt-get install -y \
        libwebkit2gtk-4.0-dev \
        build-essential \
        curl \
        wget \
        libssl-dev \
        libgtk-3-dev \
        libayatana-appindicator3-dev \
        librsvg2-dev
#COPY src src-tauri .

#RUN cargo tauri build

cmd ["cargo", "tauri", "build"]
