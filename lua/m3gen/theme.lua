M = {}

local colors = require('m3gen.colors')
local config = require('m3gen')
local generator = require('m3gen.generator')

local base_main = colors.main[config.get('source_palettes')['main']]
local base_accent = colors.accent[config.get('source_palettes')['accent']]
local base_state = colors.accent[config.get('source_palettes')['state']]

local surface = config.get('colors')['surface'] or '#0f1511'
local container = config.get('colors')['container'] or '#1b211d'

local source_color = config.get('colors')['source_color'] or '#343d37'
local primary = config.get('colors')['primary'] or '#8fd5af'
local secondary = config.get('colors')['secondary'] or '#b4ccbc'
local tertiary = config.get('colors')['tertiary'] or '#a4cddd'

local generated_main = generator.generate_colors(base_main, source_color)
-- local generated_accent = generator.generate_accents(base_accent, source_color)
-- local generated_state = generator.generate_colors(base_state, source_color)

local extend_main = {
  color0 = surface,
  color1 = container,
  color6 = secondary,
  color7 = primary,
  color8 = tertiary,
}

-- select the main, state, and accent colors based off users config options..
M.main = config.get('colors')['override'] and vim.tbl_extend('force', generated_main, extend_main) or generated_main
M.accent = base_accent
M.state = base_state

-- same for other options..
local italics = config.get('italics') and 'italic' or 'NONE'
local transparent_background = config.get('transparent_background') and 'NONE' or M.main.color0

-- the derived main table
M.main['italic'] = italics
M.main['bg'] = transparent_background
M.main['fg'] = M.main.color8

return M
