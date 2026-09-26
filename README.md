# homebrew

Homebrew tap for [debanjanbasu](https://github.com/debanjanbasu)'s projects on macOS and Linux.

## Formulas

| Formula | Project | Platforms |
|---|---|---|
| [grr](https://grr-cli.pages.dev) | Google tools from the terminal - Gmail, Calendar, Drive, Contacts, Chat, Forms | macOS (arm64), Linux (x86_64) |

## Install

Since Homebrew 4.4, third-party taps must be trusted before their formulas can be installed:

```
brew tap debanjanbasu/homebrew
brew trust debanjanbasu/homebrew
brew install grr
```

Or install straight from the tap by full formula name (the tap is added automatically; trust is still required):

```
brew trust debanjanbasu/homebrew && brew install debanjanbasu/homebrew/grr
```

## Requirements

- macOS on Apple Silicon (arm64) - no Intel (x86_64) macOS build is published
- Linux on x86_64

## More

Source code, releases, and the issue tracker live in each project's repository. grr: [debanjanbasu/grr-cli](https://github.com/debanjanbasu/grr-cli).