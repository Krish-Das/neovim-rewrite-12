---@class ThemeSpec
---@field name string Plugin name (used for `require()` and as fallback colorscheme)
---@field colorscheme? string Override passed to `vim.cmd.colorscheme` when it differs from `name`
---@field lazy boolean Lazy-loading strategy
---@field event string Lazy-loading event
---@field priority? integer Load priority (1000 = highest)
---@field config? fun(plugin: ThemeSpec, opts: table) Lifecycle hook injected by `M.activate`
---@field opts? table Options forwarded to the plugin's `setup()`

local M = {}

---Activates a single theme by name, marking it eager-loaded with priority 1000
---and injecting a `config` that calls `setup()` + `vim.cmd.colorscheme`.
---All other specs are demoted to `event = "VeryLazy"` and have `config` cleared.
---
---@param specs ThemeSpec[] List of plugin specs (mutated in place)
---@param name string `spec.name` of the theme to activate
---@return ThemeSpec[] specs The mutated list, ready to return from `colorscheme.lua`
function M.activate(specs, name)
  for _, spec in ipairs(specs) do
    if spec.name == name then
      spec.lazy = false
      spec.event = nil
      spec.priority = 1000
      local scheme = spec.colorscheme or spec.name
      local mod_name = spec.name
      local original_config = type(spec.config) == "function" and spec.config or nil
      if spec.config == true or original_config then
        -- plugin manages setup(); just ensure colorscheme is applied after
        spec.config = function(plugin, opts)
          if original_config then
            original_config(plugin, opts)
          else
            local ok, mod = pcall(require, mod_name)
            if ok and type(mod) == "table" and type(mod.setup) == "function" then
              mod.setup(opts)
            end
          end
          vim.cmd.colorscheme(scheme)
        end
      else
        spec.config = function(_, opts)
          local ok, mod = pcall(require, mod_name)
          if ok and type(mod) == "table" and type(mod.setup) == "function" then
            mod.setup(opts)
          end
          vim.cmd.colorscheme(scheme)
        end
      end
    else
      spec.lazy = true
      spec.event = "VeryLazy"
      spec.priority = nil
      spec.config = nil
    end
  end
  return specs
end

--- Get foreground and background colors of a highlight group as hex
---@param name string Highlight group name
---@return { fg: string|nil, bg: string|nil }
function M.hl_colors(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  hl = ok and hl or {}
  local function tohex(c)
    return c and string.format("#%06x", c) or nil
  end
  return { fg = tohex(hl.fg), bg = tohex(hl.bg) }
end

return M
