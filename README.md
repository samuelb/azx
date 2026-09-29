# azx - Switch between Azure Subscriptions with ease

## Installation

### Requirements

Besides `azure-cli` and `jq`, you need to have either `whiptail` or `dialog`
installed. Most Linux distributions come with one of both already. The package
which contains `whiptail` is sometimes named `newt`.

### Installing with bash

Download the `azx.sh` file and put it somewhere in your `$PATH` (e.g. `/usr/local/bin`), rename it to `azx` and ensure it is executable.

### Installing with zsh

You can follow the same instructions as for bash, but since you are using zsh, you likely use a plugin manager for zsh.

Copy-pasta one of the matching lines below into your `.zshrc` file in the section where you load your plugins.

```zsh
zgen load samuelb/azx
zcomet load samuelb/azx
zgenom load samuelb/azx
antigen bundle samuelb/azx
```

## Usage

Just run `azx` in your terminal.
