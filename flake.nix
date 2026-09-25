{
  description = "cfonts as a single self-contained binary";

  nixConfig = {
    extra-substituters = [ "https://unpins.cachix.org" ];
    extra-trusted-public-keys = [ "unpins.cachix.org-1:DDaShjbZ8VvcqxeTcAU3kV9vxZQBlyb7V/uLBHfTynI=" ];
  };

  # mkRustCrate brings the rustc with it (nix-lib's rust-overlay pin), so the
  # catalog's Rust binaries all come off the same toolchain.
  inputs.unpins-lib.url = "github:unpins/nix-lib";

  # Pure-Rust crate (fonts embedded by upstream — no runtime data, no C deps):
  # the whole platform matrix comes from mkRustCrate. cfonts does no
  # networking, so the forced-off dnsFallback costs nothing.
  outputs = { self, unpins-lib }:
    unpins-lib.lib.mkRustCrate {
      inherit self;
      name = "cfonts";

      smoke = [ "--version" ];
      smokePattern = "v[0-9]+\\.[0-9]+\\.[0-9]+";
    };
}
