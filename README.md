# Cargo Leptos Runner
cargo-leptos-runner is a container image to run CI integrations in for cargo-leptos projects.

## Usage
The current usage is pretty bare bones. The image just has the most recent version of cargo leptos installed, for the appropriate toolchain.

### Example
```yml
name: Build

on:
  push:
    branches: [ "main" ]

env:
  CARGO_TERM_COLOR: always

jobs:
  build:
    runs-on: ubuntu-latest
    container: 
      image: ghcr.io/ekshore/cargo-leptos-runner-nightly:latest

    steps:
    - uses: actions/checkout@v3
    - name: Build
      run: cargo leptos build
    - name: Run tests
      run: cargo leptos test
```

## Supported release channels
Currently the cargo-leptos-runner supports the stable and nightly release channels.
There are two different images for seperate channels postfixed with `-stable` and `-nightly`.
There is a new image for nightly built and tagged with `[version]-nightly-gitSha` or use `latest` for the most recent image.
