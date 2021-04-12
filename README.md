<div align="center">
  <h1>Daniell's dotfiles</h1>
  <img src="https://i.imgur.com/ZBiFD0S.gif" width="980px" alt="Visual Studio Code (WSL: Ubuntu 20.04)">
  <h4>Managed by <a href="https://www.gnu.org/software/stow/" target="_blank">GNU Stow<a>.<h4>
</div>

<div align="center">
  <img src="https://img.shields.io/github/license/daniellwdb/dotfiles?style=for-the-badge" alt="GitHub" />
  <img src="https://img.shields.io/github/stars/daniellwdb/dotfiles?style=for-the-badge" alt="GitHub" />
  <img src="https://img.shields.io/github/issues-raw/daniellwdb/dotfiles?style=for-the-badge" alt="GitHub" />
</div>

<p align="center">
  <a href="#-about">About</a> •
  <a href="#-getting-started">Getting Started</a> •
  <a href="#-contributing">Contributing</a> •
  <a href="#-license">License</a>
</p>

## ℹ About

These are the dotfiles that I use when I set up a new enviroment using Windows and [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10) with Ubuntu. The setup is mainly focused on [Visual Studio Code](https://code.visualstudio.com/) being the primary text editor and for terminal tasks related to programming, for other tasks I am using [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701?activetab=pivot:overviewtab).

All user interfaces are themed after [Nord](https://www.nordtheme.com/), An arctic, north-bluish color palette.

## 🚀 Getting Started

### Font

I am using [Cascadia Code](https://github.com/microsoft/cascadia-code) as my primary font for both Visual Studio Code and terminals.

### WSL2

I am using [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) with [Ubuntu 20.04][1].

[1]: https://www.microsoft.com/en-us/p/ubuntu-2004-lts/9n6svws3rx71?activetab=pivot:overviewtab

### Preparing

Clone the repository on Linux:

```bash
cd ~
git clone --recursive https://github.com/daniellwdb/dotfiles.git
cd dotfiles
```

Make `zsh` the default shell for Linux:

```bash
chsh -s $(which zsh)
```

Run the appropiate semi-interactive scripts in their own environments.

**⚠️ Only run these scripts if you understand what they do ⚠️**

See: [install.ps1](install.ps1) and [install.zsh](install.zsh)

| OS      | Environment           | Command                                                       |
| ------- | --------------------- | ------------------------------------------------------------- |
| Windows | Powershell (as Admin) | `\\wsl$\Ubuntu-20.04\home\your-username\dotfiles\install.ps1` |
| Ubuntu  | Ubuntu shell          | `~/dotfiles/install.zsh`                                      |

The setup process will do the following:

_Windows:_

- Prompt to install Visual Studio Code extensions that I use.
- Prompt to create a symlink for Visual Studio Code settings to manage them with Git.
- Prompt to create a symlink for Windows Terminal settings to manage them with Git.
- Prompt to create a symlink for WSL2 config to manage with Git.

_Ubuntu:_

- Install common dependencies.
- Prompt to install individual dotfiles managed with GNU Stow.
- Prompt to install Visual Studio code extensions that I use.

## 💕 Contributing

Feel free to open any kind of pull request!

Please note that most configuration files are tweaked to my personal preferences, if you wish to make changes to UI specific configurations, consider forking this repository instead.

## 📑 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
