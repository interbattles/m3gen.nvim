local M = {}
local core = require('matugen.core')
local highlights = require('matugen.highlights')

function M.setup()
  local colors = core.get_colors()
  vim.opt.termguicolors = true
  highlights.highlight_all(colors)
end

return M
