local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'mikavilpas/yazi.nvim', name = 'yazi' } }
require('yazi').setup {
  -- if you want to open yazi instead of netrw, see below for more info
  open_for_directories = true,
}

-- 👇 in this section, choose your own keymappings!
vim.keymap.set('n', '<leader>-', '<cmd>Yazi<cr>', { desc = 'Open yazi at the current file' })
vim.keymap.set('n', '<leader>cw', '<cmd>Yazi cwd<cr>', { desc = "Open the file manager in nvim's working directory" })
vim.keymap.set('n', '<c-s-up>', '<cmd>Yazi toggle<cr>', { desc = 'Resume the last yazi session' })

-- 👇 if you use `open_for_directories=true`, this is recommended.
--
-- mark netrw as loaded so it's not loaded at all.
-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
vim.g.loaded_netrwPlugin = 1

-- vim: ts=2 sts=2 sw=2 et
