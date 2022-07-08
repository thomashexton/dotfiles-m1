# dotfiles m1

## Before Setup

### Prerequisites

- You need to have `git` installed on your machine. For MacOS:

  ```sh
  xcode-select --install
  ```

- Ensure you haven't installed any additional programs, e.g. Google Chrome.

  This will interfere with the setup script and cause it to fail.

## Setup

```sh
git clone https://github.com/thomashexton/dotfiles-m1.git ~/dotfiles-m1
cd ~/dotfiles-m1
./setup
```

## After Setup

### Git

- Run the following, replacing values with your own:
- It is recommended to use your GitHub-provided `noreply` address ... [see setting your commit email address.](https://help.github.com/en/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address#setting-your-commit-email-address-on-github)

  ```sh
  git config --global user.name "Your Name"
  git config --global user.email "you@example.com"
  ```

<!-- - For extra credit, [setup GPG signing](https://help.github.com/en/github/authenticating-to-github/signing-commits) for your commits.

```sh
git config --global commit.gpgsign true
git config --global gpg.program "gpg"
``` -->

### SSH

- Either restore your ssh key or [generate a new key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Secrets

Secret data should be stored in `custom/secret.zsh`

- For example:

  ```sh
  export SOME_TOKEN=abcdef123456
  ```

This file is ignored so it isn't accidentally committed with sensitive information.
