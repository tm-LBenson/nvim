-- core
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Harpoon
vim.keymap.set("n", "ha", require('harpoon.mark').add_file)
vim.keymap.set("n", "<C-e>", require('harpoon.ui').toggle_quick_menu)
vim.keymap.set("n", "hn", require('harpoon.ui').nav_next)
vim.keymap.set("n", "hp", require('harpoon.ui').nav_prev)




-- NERDTree

-- Toggle NERDTree or find current file
local function toggle_or_find_nerdtree()
  local nerdtree_exists = vim.fn.exists("t:NERDTreeBufName")
  if nerdtree_exists == 1 and vim.fn.bufwinnr(vim.t.NERDTreeBufName) ~= -1 then
    vim.cmd("NERDTreeToggle")
  else
    vim.cmd("NERDTreeFind")
  end
end

vim.keymap.set("n", "<C-b>", toggle_or_find_nerdtree)


-- Visual Multi key bindings
vim.keymap.set("n", "<leader>ma", "<Plug>(VM-Select-All)<Tab>", { desc = "Select All" })
vim.keymap.set("n", "<leader>mr", "<Plug>(VM-Start-Regex-Search)", { desc = "Start Regex Search" })
vim.keymap.set("n", "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add Cursor At Pos" })
vim.keymap.set("v", "<leader>mv", "visual_cursors_with_delay", { desc = "Visual Cursors" })
vim.keymap.set("n", "<leader>mo", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle Mapping" })


-- Prettier
vim.api.nvim_set_keymap('n', '<leader>f', ':lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })

