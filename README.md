# cfonts

[cfonts](https://github.com/dominikwilkowski/cfonts) — big, colorful ANSI banner text for the terminal. A single self-contained binary, built natively for Linux, macOS, and Windows.

[![CI](https://github.com/unpins/cfonts/actions/workflows/cfonts.yml/badge.svg)](https://github.com/unpins/cfonts/actions)
![Linux](https://img.shields.io/badge/Linux-✓-success?logo=linux&logoColor=white)
![macOS](https://img.shields.io/badge/macOS-✓-success?logo=apple&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-✓-success?logo=windows&logoColor=white)

Part of the [unpins](https://unpins.org) catalog; install it with [`unpin`](https://github.com/unpins/unpin): `unpin install cfonts`.

## Usage

Run the `cfonts` program with [unpin](https://github.com/unpins/unpin):

```bash
unpin cfonts "hello" --gradient red,blue
```

To install it onto your PATH:

```bash
unpin install cfonts
```

## Build locally

```bash
nix build github:unpins/cfonts
./result/bin/cfonts "hello"
```

Or run directly:

```bash
nix run github:unpins/cfonts -- "hello"
```

The first invocation will offer to add the [unpins.cachix.org](https://unpins.cachix.org) substituter so most pulls come pre-built.

## Manual download

The [Releases](https://github.com/unpins/cfonts/releases) page has standalone binaries for manual download.

## Build notes

- This packages the upstream [Rust implementation](https://github.com/dominikwilkowski/cfonts/tree/released/rust) (the original is a Node.js library); all fonts are embedded in the binary by upstream, so there is no runtime data to carry.
- The cross-compiled Linux targets (i686, armv7l, ppc64le, riscv64) need no C cross toolchain at all: rustup's `rust-std` for musl targets bundles musl's libc and crt objects (self-contained linking), and the native `ld.lld` produces the final static binary.
- Upstream ships no man page, so none is embedded.
- No upstream features are disabled; no platforms are excluded.
