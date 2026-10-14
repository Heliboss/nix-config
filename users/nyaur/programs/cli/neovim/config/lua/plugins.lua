-- Load plugin modules in order.

require 'kickstart.plugins.guess-indent'
require 'kickstart.plugins.gitsigns'
require 'kickstart.plugins.which-key'
require 'kickstart.plugins.todo-comments'
require 'kickstart.plugins.mini'
require 'kickstart.plugins.telescope'
require 'kickstart.plugins.lspconfig'
require 'kickstart.plugins.conform'
require 'kickstart.plugins.blink-cmp'
require 'kickstart.plugins.treesitter'

require 'kickstart.plugins.debug'
require 'kickstart.plugins.indent_line'
require 'kickstart.plugins.lint'
require 'kickstart.plugins.autopairs'

require 'custom.plugins'
-- `custom.plugins` automatically loads files from that directory, but their
-- order is unspecified. If plugins depend on each other, keep them in the same
-- file and put their `vim.pack.add()` and `setup()` calls in the required order.
--
-- If separate modules need a specific order, require them explicitly instead:
-- require 'custom.plugins.colorscheme'
-- require 'custom.plugins.ui'
-- require 'custom.plugins.git'

-- vim: ts=2 sts=2 sw=2 et
