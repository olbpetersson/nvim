local builtin = require('telescope.builtin')

require('telescope').setup{
  pickers = {
    find_files = {
      hidden = true
    }
  },
  defaults = {
    file_ignore_patterns = {
      "node_modules", ".git", ".next"
    }
  }
}
