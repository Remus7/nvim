return {
  'echasnovski/mini.files', 
  version = false,

  config = function()
    -- Mini-files for navigating filesystems
    require('mini.files').setup()
    vim.keymap.set('n', '<leader>o', MiniFiles.open, {})
  end
}
