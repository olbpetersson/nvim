 -- require("nvim-ts-autotag").setup {}
require('nvim-treesitter.configs').setup {
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'css',
    'json',
    'lua',
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<A-w>",
      scope_incremental = "<TAB>",
      node_incremental = "<A-w>",
      node_decremental = "<A-S-w>",
    },
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      -- clear_on_cursor_move = true,
    },
  },
}

