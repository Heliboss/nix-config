local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'rose-pine/neovim', name = 'rose-pine' } }
---@diagnostic disable-next-line: missing-fields
require('rose-pine').setup {
  styles = {
    transparency = true,
  },
}
vim.cmd 'colorscheme rose-pine-moon'

-- vim: ts=2 sts=2 sw=2 et
