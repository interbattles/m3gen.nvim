M = {}

local config = {
  colors = {
    override = true,
    source_color = '#343d37',

    surface = '#0f1511',
    container = '#1b211d',
    primary = '#8fd5af',
    secondary = '#b4ccbc',
    tertiary = '#a4cddd',
  },

  source_palettes = {
    main = 'dark',
    accent = 'pastel',
    state = 'pastel',
  },

  italics = true,
  transparent_background = false,

  caching = true,
  cache_dir = vim.fn.stdpath('cache') .. '/m3gen',
}

M.setup = function(opts)
  config = vim.tbl_extend('force', config, opts)
end

M.get = function(key)
  return config[key]
end

function M.load()
  vim.g.colors_name = 'm3gen'

  -- options
  vim.o.termguicolors = true
  vim.o.background = 'dark'

  -- get merged highlight groups
  local highlights = require('m3gen.highlights')

  -- load the colorscheme mappings
  require('m3gen.utils').apply_highlight_groups(highlights, config['caching'])
end

return M
