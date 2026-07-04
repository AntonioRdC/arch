# Packages

Pacotes oficiais:

```sh
sudo pacman -S --needed - < ~/.config/dotfiles/packages/pacman.txt
```

Pacotes AUR, depois de instalar o `yay`:

```sh
yay -S --needed - < ~/.config/dotfiles/packages/aur.txt
```

Observacao: `yay-debug` foi deixado fora da lista porque e pacote debug gerado pelo AUR, nao e necessario para restaurar o sistema.
