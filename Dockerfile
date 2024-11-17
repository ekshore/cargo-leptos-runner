FROM alpine:latest

ARG TOOLCHAIN="stable"

LABEL org.opencontainers.image.source="https://github.com/ekshore/cargo-leptos-runner"

RUN apk upgrade --no-cache

RUN apk add --update alpine-sdk
RUN apk add curl

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
ENV RUSTUP_HOME "/root/.rustup"

RUN rustup install ${TOOLCHAIN}
RUN rustup default ${TOOLCHAIN}

RUN rustup target add --toolchain ${TOOLCHAIN} wasm32-unknown-unknown

RUN cargo install cargo-leptos
