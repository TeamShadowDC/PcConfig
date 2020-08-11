#Quick start
##Manual

Clone the typewritten repository somewhere you can easily link. I recommend creating a ==.zsh== directory at root.
```bash
mkdir -p "$HOME/.zsh"
git clone https://github.com/reobin/typewritten.git "$HOME/.zsh/typewritten"
```
Load typewritten in your ==.zshrc== by using zsh prompinit:
```bash
fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten
```
Note: if using oh-my-zsh, set ZSH_THEME="" in your .zshrc to disable oh-my-zsh themes.
oh-my-zsh

Clone the repository into your custom oh-my-zsh themes directory:
```bash
git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
```
Symlink typewritten.zsh-theme to your oh-my-zsh custom themes directory:
```bash
ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"
```
Set ==ZSH_THEME="typewritten"== in your ==.zshrc== file.
