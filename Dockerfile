FROM ubuntu:22.04

ARG TOOLCHAIN="stable"

RUN apt-get update -y

RUN apt-get install -y \
    build-essential \
    pkg-config \
    libssl-dev \
    curl

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/home/github/.cargo/bin:${PATH}"
ENV PATH="/root/.cargo/bin:${PATH}"
ENV RUSTUP_HOME "/root/.rustup"

RUN rustup install ${TOOLCHAIN}
#RUN rustup install nightly
RUN rustup default ${TOOLCHAIN}

#RUN rustup target add --toolchain nightly wasm32-unknown-unknown
RUN rustup target add --toolchain ${TOOLCHAIN} wasm32-unknown-unknown

RUN cargo install cargo-leptos
