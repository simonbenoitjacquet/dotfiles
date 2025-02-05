# Simon Jacquet dotfiles, inspired by 'The Official&trade; MrPickles Dotfiles Repository'

These are my personal dotfiles.

These dotfiles are intended for use with zsh, [oh-my-zsh][].
The configuration uses powerline-based status bars for vim and tmux and
[Powerlevel10k][powerlevel10k] as its zsh theme.

## Set-up instructions

Update apt:
```shell
sudo apt update
```

Get and run the installation script:
```shell
bash <(curl -L https://raw.githubusercontent.com/simonbenoitjacquet/dotfiles/master/dotfiles.sh)
```

<!-- Install neovim, git, delta, ripgrep, fzf, fd, exa, bat: -->
<!-- ```shell -->
<!-- sudo apt install -y neovim git-all delta ripgrep fzf fd-find exa rust-bat -->
<!-- ``` -->

## Prequisites

These dotfiles have been conceived to work with Linux and installs packages
with apt.

Otherwise, all needed packages are automatically installed if needed
(such as git, neovim, tmux, zsh and others).

## Old README
These dotfiles contain the following software dependencies:

* Linux or MacOS
* Vim 8.0+ (or Neovim 0.6.0+)

There currently is no Windows support.
However, MacOS and most flavors of Linux should work fine.

## Setting up your Local Machine

_[Go to the next section](#installation) if you have already configured these
dotfiles on your machine once, or if you are SSHing into another machine.
These setup instructions only need to be done once on a local machine._

New machines require two tasks to be done which are not part of the setup
script:

* Installing (and using) Powerline/FontAwesome-compatible fonts.
* Using the Solarized colorscheme.

### MacOS

#### Installing Fonts with Custom Glyph Support

We will be using [Nerd Fonts][nerd-fonts] to patch in all of our symbols.
This font aggregator is nice in the sense that it collects many different glyphs
from various sources.
(We'll be using a lot of different symbols!)

Follow the [Powerlevel10k font instructions][p10k-fonts] to install the proper
fonts.

```shell
p10k configure
```

The Text section of my iTerm settings looks like the picture below.

![Text section of iTerm settings](images/iterm_options.png)

#### Solarized on iTerm

The Solarized colors for iTerm can be found in its
[official repository][solarized-repo].
(You won't need to download it.)
In the `Colors` section of your iTerm profile, use the `Solarized Dark` preset.

#### Enable Copy/Paste in Tmux

On Macs, `pbcopy` and `pbpaste` don't natively work in tmux.
Luckly there's a [Homebrew][homebrew] formula to fix that.

```shell
brew install reattach-to-user-namespace
```

The tmux configuration will do the rest for you.
Note that this only applies to machines running MacOS.

#### Enable Mouse Wheel Scrolling in Vim on iTerm

If using iTerm, setting `Scroll wheel sends arrow keys when in alternate screen
mode.` to `Yes` will allow trackpad scrolling while in Vim.
The setting can be found in the advanced preferences.

#### Enabling the Meta Key on iTerm

If using iTerm, you may want to set the option key mode to `Esc+` to make it be
a meta key.
It's used for a few shortcuts, such as resizing tmux panes.

#### Bold Text Color

Uncheck the `Brighten Bold Text` option in iTerm if all bold text is gray.

### Linux

#### Downloading Fonts for Linux

Similarly to that of MacOS, you'll need to fetch modified fonts.
We'll install the same font that we use for MacOS.
Follow the [Powerlevel10k font instructions][p10k-fonts] to install the proper
fonts.

#### Solarized on Ubuntu Terminal

To get Solarized on the Ubuntu Terminal, you will want to create a new profile.
The solarized colorscheme should be a default option on most modern terminals.
If it's not default, follow the instructions in
[gnome-terminal-colors-solarized][] to set the color scheme.

### Other optional tools

There are a few recommended (but optional) tools you can install to improve your
shell experience in general.

* [`delta`][delta]: Delta is a diffing tool that works great with git.
* [`rg`][rg]: Ripgrep is a faster alternative over `ag`, `ack`, and `grep`.
* [`fzf`][fzf]: Fzf is a highly performant fuzzy finder.
* [`fd`][fd]: `fd` is a faster alternative to the `find` command. It works very
  well when paired with `fzf`.
* [`exa`][exa]: An improved version of `ls`. We use its tree feature to improve
  the output of `<alt-c>` from `fzf` and directory tab completion.
* [`bat`][bat]: An improved version of `cat`. We use it for the file previews
  when running `<ctrl-t>` from `fzf`.

You should install all of these independently of this dotfile repo.
Figuring out how to install them is left as an exercise for the reader.

## Installation

Installation is as simple as downloading and running the install script.
The install script will run the configuration script, which fetches oh-my-zsh
and symlinks the dotfiles to your home directory.

```shell
curl -L andrew.cloud/dotfiles.sh | sh
# or
wget -qO- andrew.cloud/dotfiles.sh | sh
```

Alternatively, you can manually clone the repository and run the `setup.sh`
script.

```shell
git clone --filter=blob:none git@github.com:MrPickles/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh -t build
```

You will also likely need to manually change your shell to `zsh` if you are
currently using a different shell.

```shell
chsh -s $(which zsh)
```

## Customizing

You can customize zsh, vim, tmux, and git for each specific machine.
Just put any additional configurations in the following files:

* `~/.zshrc.local`
* `~/.vimrc.local`
* `~/.tmux.conf.local`

Custom git configurations can be placed in `~/.gitconfig`.
The normal git config file is not put under version control, so it's safe to put
machine-specific tokens in it.

[solarized]: http://ethanschoonover.com/solarized
[homebrew]: http://brew.sh/
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
[delta]: https://github.com/dandavison/delta
[nerd-fonts]: https://github.com/ryanoasis/nerd-fonts
[p10k-fonts]: https://github.com/romkatv/powerlevel10k/#meslo-nerd-font-patched-for-powerlevel10k
[gnome-terminal-colors-solarized]: https://github.com/Anthony25/gnome-terminal-colors-solarized
[solarized-repo]: https://github.com/altercation/solarized
[rg]: https://github.com/BurntSushi/ripgrep
[fd]: https://github.com/sharkdp/fd
[fzf]: https://github.com/junegunn/fzf
[bat]: https://github.com/sharkdp/bat
[itermcolors]: https://raw.githubusercontent.com/altercation/solarized/e40cd4130e2a82f9b03ada1ca378b7701b1a9110/iterm2-colors-solarized/Solarized%20Dark.itermcolors
[powerlevel10k]: https://github.com/romkatv/powerlevel10k
[exa]: https://github.com/ogham/exa
