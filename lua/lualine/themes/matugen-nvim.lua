local core = require('matugen.core')
local colors = core.get_colors()

local matugen = {}

matugen.normal = {
  a = { bg = colors.color4, fg = colors.background },
  b = { bg = colors.background, fg = colors.color7 },
  c = { bg = colors.transparent, fg = colors.color4 },
}

matugen.insert = {
  a = { bg = colors.color2, fg = colors.background },
  b = { bg = colors.background, fg = colors.color4 },
}

matugen.command = {
  a = { bg = colors.color5, fg = colors.background },
  b = { bg = colors.background, fg = colors.color5 },
}

matugen.visual = {
  a = { bg = colors.color6, fg = colors.background },
  b = { bg = colors.background, fg = colors.color6 },
}

matugen.replace = {
  a = { bg = colors.color11, fg = colors.background },
  b = { bg = colors.background, fg = colors.color11 },
}

matugen.inactive = {
  a = { bg = colors.background, fg = colors.color7 },
  b = { bg = colors.background, fg = colors.foreground, gui = "bold" },
  c = { bg = colors.background, fg = colors.foreground },
}

return matugen
