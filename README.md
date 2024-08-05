<p align="center">
  <h2 align="center">🎨 m3gen.nvim</h2>
  <h4 align="center">material 3 (material you) color generation tool now in neovim!</h4>
  <h5 align="center">not possible without <a href="https://github.com/roobert/palette.nvim">palette.nvim</a></h5>
  <h6 align="center">many thanks 🎉</h5>
  <h6 align="center">(nearly completely inspired ~~stolen~~ 😼)</h6>
</p>

## default config:
```lua
local config = {
  colors = {
    override = true, -- overrides generated colors with colors of choice to achieve more consistent coloring
    source_color = '#343d37', -- main color extracted to create scheme (from image, standalone, etc.)

    surface = '#0f1511', -- background
    container = '#1b211d', --objects "on top of" background
    primary = '#8fd5af', -- main color
    secondary = '#b4ccbc', -- alternate color
    tertiary = '#a4cddd', -- alternate color
  },

  source_palettes = {
    main = 'dark', -- dark, light, pastel
    accent = 'pastel', -- dark, light, pastel
    state = 'pastel', -- dark, light, pastel
  },

  italics = true,
  transparent_background = false, -- may cause some issues

  caching = true,
  cache_dir = vim.fn.stdpath('cache') .. '/m3gen',
}
```
