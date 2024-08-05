local M = {}
local hsl2rgb = require('m3gen.utils').hsl2rgb
local rgb2hsl = require('m3gen.utils').rgb2hsl
local hex2rgb = require('m3gen.utils').hex2rgb
local rgb2hex = require('m3gen.utils').rgb2hex

local function ordered_keys(tbl)
  local keys = {}
  for key in pairs(tbl) do
    table.insert(keys, key)
  end
  table.sort(keys, function(a, b)
    return a < b
  end)
  return keys
end

local function reverse_table(t)
  local reversed_table = {}
  local keys = ordered_keys(t)
  local reversed_values = {}

  -- Create an array of values in reverse order
  for _, key in ipairs(keys) do
    table.insert(reversed_values, 1, t[key])
  end

  -- Associate original keys with reversed values
  for i, key in ipairs(keys) do
    reversed_table[key] = reversed_values[i]
  end

  return reversed_table
end

-- Compute new colors based on base color and differences
M.generate_colors = function(base_colors, new_base_color, reverse)
  local base = rgb2hsl(hex2rgb(new_base_color))
  local prev_color = rgb2hsl(hex2rgb(base_colors.color0))
  local differences = {}
  local colors = {}

  -- compute differences
  for i = 1, 8 do
    local current = rgb2hsl(hex2rgb(base_colors['color' .. i]))
    local diff = {
      h = current.h - prev_color.h,
      s = current.s - prev_color.s,
      l = current.l - prev_color.l,
    }
    table.insert(differences, diff)
    prev_color = current
  end

  -- apply differences to new base color
  colors.color0 = new_base_color
  for i, diff in ipairs(differences) do
    base = {
      h = base.h + diff.h,
      s = base.s + diff.s,
      l = base.l + diff.l,
    }
    colors['color' .. i] = rgb2hex(hsl2rgb(base))
  end

  if reverse then
    colors = reverse_table(colors)
  end

  return colors
end

M.generate_accents = function(base_colors, new_accent_color)
  local base = rgb2hsl(hex2rgb(new_accent_color))
  local prev_color = rgb2hsl(hex2rgb(base_colors.accent0))
  local differences = {}
  local accents = {}

  -- compute differences
  for i = 1, 7 do
    local current = rgb2hsl(hex2rgb(base_colors['accent' .. i]))
    local diff = {
      h = current.h - prev_color.h,
      s = current.s - prev_color.s,
      l = current.l - prev_color.l,
    }
    table.insert(differences, diff)
    prev_color = current
  end

  -- apply differences to new base color
  accents.accent0 = new_accent_color
  for i, diff in ipairs(differences) do
    base = {
      h = base.h + diff.h,
      s = base.s + diff.s,
      l = base.l + diff.l,
    }
    accents['accent' .. i] = rgb2hex(hsl2rgb(base))
  end

  return accents
end

return M
