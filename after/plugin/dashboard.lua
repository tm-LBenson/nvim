-- init.lua or a separate configuration file for dashboard settings
vim.g.dashboard_default_executive = 'telescope'

-- Function to get all key mappings
local function get_keymaps()
  local keymaps = vim.api.nvim_get_keymap('n')
  local keymap_list = {}
  for _, keymap in pairs(keymaps) do
    table.insert(keymap_list, string.format("%s -> %s", keymap.lhs, keymap.rhs))
  end
  return keymap_list
end

-- Custom command to open a buffer with key bindings
vim.cmd([[
  command! Keymaps lua require('dashboard').new_file(get_keymaps())
]])

-- Dashboard custom header
vim.g.dashboard_custom_header = {
  'Key Bindings Dashboard',
}

-- Dashboard custom section with a shortcut to open key bindings buffer
vim.g.dashboard_custom_section = {
  a = {description = {'Open Keymaps'}, command = 'Keymaps'}
}

