{
  description = "Standalone build of cfonts";

  nixConfig = {
    extra-substituters = [ "https://unpins.cachix.org" ];
    extra-trusted-public-keys = [ "unpins.cachix.org-1:DDaShjbZ8VvcqxeTcAU3kV9vxZQBlyb7V/uLBHfTynI=" ];
  };

  inputs = {
    unpins-lib.url = "github:unpins/nix-lib";
    # Consumed by mkRustCrate: rustup-distributed rust-std for the cross-musl
    # targets, so no cross compiler of any kind is built from source.
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "unpins-lib/nixpkgs";
    };
  };

  # Pure-Rust crate (fonts embedded by upstream — no runtime data, no C deps):
  # the whole platform matrix comes from mkRustCrate. cfonts does no
  # networking, so the forced-off dnsFallback costs nothing.
  outputs = { self, unpins-lib, rust-overlay }:
    unpins-lib.lib.mkRustCrate {
      inherit self rust-overlay;
      name = "cfonts";

      smoke = [ "--version" ];
      smokePattern = "v[0-9]+\\.[0-9]+\\.[0-9]+";
    };
}
