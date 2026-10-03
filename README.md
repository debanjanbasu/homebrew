# homebrew-tap

Homebrew tap for [debanjanbasu](https://github.com/debanjanbasu)'s projects on macOS and Linux.

## Formulas

|Formula|Project|Platforms|
|---|---|---|
|[grr](https://grr-cli.pages.dev)|Google tools from the terminal - Gmail, Calendar, Drive, Contacts, Chat, Forms|macOS (arm64), Linux (x86_64 + arm64)|

## Install

Since Homebrew 4.4, third-party taps must be trusted before their formulas can be installed:

```
brew tap debanjanbasu/tap
brew trust debanjanbasu/tap
brew install grr
```

Or, without tapping first:

```
brew install debanjanbasu/tap/grr
```

## Maintenance

`Formula/grr.rb` updates itself: `.github/workflows/update-grr.yml` runs every
six hours (and on demand), reads the latest grr-cli release and its
SHA256SUMS, and regenerates the formula via `scripts/update-formula.sh`. No
cross-repo secret is involved — the tap reads public release data with its own
token. Adding another package to this tap is a new file under `Formula/` plus
a generator (or manual maintenance) for it.
