## Installation

1. Backup your existing nvim config

  ```bash
  mv ~/.config/nvim ~/.config/nvim.bak
  ```

2. Clone the repo

  ```bash
  git clone git@github.com:NachiketNamjoshi/nvim.config.git ~/.config/nvim
  ```

3. Install all plugins before actually using nvim
  
  ```bash
  nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
  ```

4. Launch `nvim`

5. *(Optional)* Run `:Mason` as it will install all the Language Servers

## Language Servers

These are the language servers that are installed by default:

  - `json-lsp`
  - `lua-language-server`
  - `bash-language-server`
  - `vim-language-server`
  - `dockerfile-language-server`
  - `css-lsp`
  - `html-lsp`
  - `pyright`
  - `rust-analyzer`
  - `typescript-language-server`
  - `clangd`
  - `gopls`
  - `phpactor`
  - `sqlls`
  - `yaml-language-server`

## Keybinds

The leader has been set to `,`

#### Window navigation
- `Ctrl + h`: Move cursor to left pane
- `Ctrl + j`: Move cursor to below pane
- `Ctrl + k`: Move cursor to above pane
- `Ctrl + l`: Move cursor to right pane

#### Window Resizing
- `Ctrl + Up Arrow`: Increase size horizontally
- `Ctrl + Down Arrow`: Decrease size horizontally
- `Ctrl + Left Arrow`: Increase size vertically
- `Ctrl + Right Arrow`: Decrease size vertically

#### Buffers
- `Alt + 1-9`: Go to Buffer #
- `Alt + 0`: Go to last buffer
- `Alt + p`: Pin current buffer
- `Alt + c`: Close current buffer
- `Alt + ,`: Go to Previous Buffer
- `Alt + .`: Go to Next Buffer
- `Alt + <`: Move Buffer to previous position
- `Alt + >`: Move Buffer to next position

#### Telescope / File navigation
- `Ctrl + p`: Telescope Find Files
- `Ctrl + b`: Telescope Find Buffers
- `Ctrl + f`: Telescope Find in files (Fuzzy text search)

#### Multi-line / Multi-cursor
- Defaults from: [mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi)
