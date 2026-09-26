# Changelog

## [Unreleased]

### Added

- The README warns that cfonts reads standard input whenever it is not a
  terminal, even with the text on the command line — and throws that input
  away. Inside a `while read … done < file` loop it therefore swallows the rest
  of the file and the loop ends after one round, silently. Redirect its input
  (`cfonts "hi" < /dev/null`) when calling it from a script. This is how cfonts
  behaves everywhere, not something this build introduces.

### Changed

- Built with the Rust toolchain the rest of the catalog's Rust binaries use;
  this flake no longer pins one of its own. The Linux x86_64 binary is within a
  kilobyte of the previous release and behaves the same.
