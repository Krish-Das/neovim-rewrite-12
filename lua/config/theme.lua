---@class ThemeSpec
---@field name string Plugin name (used for `require()` and as fallback colorscheme)
---@field colorscheme? string Override passed to `vim.cmd.colorscheme` when it differs from `name`
---@field lazy boolean|string Lazy-loading strategy
---@field priority? integer Load priority (1000 = highest)
---@field config? fun(plugin: ThemeSpec, opts: table) Lifecycle hook injected by `M.activate`
---@field opts? table Options forwarded to the plugin's `setup()`

local M = {}

---Activates a single theme by name, marking it eager-loaded with priority 1000
---and injecting an `init` that calls `setup()` + `vim.cmd.colorscheme`.
---All other specs are demoted to `event = "VeryLazy"` and have `init` cleared.
---
---@param specs ThemeSpec[] List of plugin specs (mutated in place)
---@param name string `spec.name` of the theme to activate
---@return ThemeSpec[] specs The mutated list, ready to return from `colorscheme.lua`
function M.activate(specs, name)
  for _, spec in ipairs(specs) do
    if spec.name == name then
      spec.lazy = false
      spec.priority = 1000
      local has_own_setup = spec.config == true -- capture before overwriting
      spec.config = function(plugin, opts)
        local scheme = plugin.colorscheme or plugin.name
        if not has_own_setup then
          require(plugin.name).setup(opts)
        end
        vim.cmd.colorscheme(scheme)
      end
    else
      spec.lazy = "VeryLazy"
      spec.priority = nil
      spec.config = nil
    end
  end
  return specs
end
return M
