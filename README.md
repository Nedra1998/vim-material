# Vim-Material

This is a color scheme based on the [Material](https://flatuicolors.com/) color
scheme. The color scheme should work out of the box, for `vim`, `gvim`, or
`nvim`. Simply install the color scheme and set it in your `.vimrc` or
`init.vim`.

## Install

### Pathogen

```fish
cd ~/.vim/bundle
git clone https://github.com/Nedra1998/vim-flatui
```

### Vundle

```vim
Plugin 'Nedra1998/vim-material'
```

### Vim-Plug

```vim
Plug 'Nedra1998/vim-material'
```

## Usage

Simply set the colors scheme to `material` and pick the variant.

```vim
let background=dark " Or light for the light variant
colorscheme flatui
```

## Plugins

### Airline

Set the airline color scheme to `material` to pick the matched color scheme.

```vim
let g:airline_theme = 'material'
```
