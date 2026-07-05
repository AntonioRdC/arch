# Dotfiles

Config pessoal do Arch + Hyprland.

Inclui Hyprland modular em Lua, Waybar, Rofi, Wlogout, Kitty, Zsh, Fastfetch,
Starship, Dunst, Btop, Bat, Qt/KDE/Kvantum, GTK e temas Catppuccin.

## Restore em um sistema novo

Instale o Git primeiro:

```sh
sudo pacman -S --needed git
```

Clone como bare repo:

```sh
git clone --bare git@github.com:SEU_USER/dotfiles.git "$HOME/.dotfiles"
```

Crie o alias temporario:

```sh
alias dots='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
```

Evite listar a home inteira como untracked:

```sh
dots config --local status.showUntrackedFiles no
```

Restaure os arquivos:

```sh
dots checkout
```

Se o checkout reclamar de arquivos existentes, mova ou apague os arquivos
locais conflitantes e rode `dots checkout` de novo.

## Pacotes

Depois de restaurar os arquivos, instale os pacotes oficiais:

```sh
sudo pacman -S --needed - < ~/.config/dotfiles/packages/pacman.txt
```

Instale os pacotes AUR:

```sh
yay -S --needed - < ~/.config/dotfiles/packages/aur.txt
```

As listas ficam em:

- `~/.config/dotfiles/packages/pacman.txt`
- `~/.config/dotfiles/packages/aur.txt`

## Uso diario

O alias permanente fica no `~/.zshrc`:

```sh
dots status
dots add ~/.config/hypr
dots commit -m "Update config"
dots push
```

## Notas manuais

Algumas coisas precisam de passo manual porque mexem fora da home:

- SDDM theme: `/usr/share/sddm/themes/sddm-astronaut-theme`
- GRUB theme: `/usr/share/grub/themes/catppuccin-mocha-grub-theme`
- fontes e icones instalados via pacman/AUR

Depois de instalar tudo, reinicie a sessao ou o sistema para garantir que Qt,
GTK, portals, Waybar e SDDM carreguem os temas corretamente.
