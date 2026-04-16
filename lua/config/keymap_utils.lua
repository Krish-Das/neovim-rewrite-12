---Create keymappings with optional description and mode
---@param keys string The keys to map
---@param func string|function The command or function to execute
---@param desc string|nil Description for the mapping
---@param mode string|string[]|nil Mode(s) for the mapping (default: "n")
---@return nil
local function map(keys, func, desc, mode)
  mode = mode or "n"
  desc = desc or nil
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, keys, func, opts)
end

---Delete keymappings with optional mode
---@param keys string The keys to delete
---@param mode string|string[]|nil Mode(s) for the mapping (default: "n")
---@return nil
---@diagnostic disable-next-line: unused-function, unused-local
local function unmap(keys, mode)
  mode = mode or "n"
  vim.keymap.del(mode, keys)
end

return map
