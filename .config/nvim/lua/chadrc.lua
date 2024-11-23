---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
}

if not vim.g.vscode then
  M.nvdash = {
    load_on_startup = true,
  }
end

return M
