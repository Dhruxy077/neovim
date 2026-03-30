-- ==========================================
-- 1. LEADER KEY (Must be first!)
-- ==========================================
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ==========================================
-- 2. VIM OPTIONS
-- ==========================================
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"

-- ==========================================
-- 3. KEYMAPS
-- ==========================================
-- Your original keymaps
vim.keymap.set("n", "H", ":tabp<CR>", {})
vim.keymap.set("n", "L", ":tabn<CR>", {})
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", {})
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "X", ":echo 'neovim is reading my file!' <CR>")

-- The buffer closing keymaps you requested earlier
vim.keymap.set("n", "<leader>c", ":bd<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bD", ":bdelete<CR>", { desc = "Delete buffer and window" })
vim.keymap.set("n", "<leader>,", ":buffers<CR>:buffer ", { desc = "List and switch buffers" })

vim.keymap.set("n", "<leader>bo", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local all_bufs = vim.api.nvim_list_bufs()
  for _, buf in ipairs(all_bufs) do
    if vim.api.nvim_buf_is_loaded(buf) and buf ~= current_buf then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
end, { desc = "Close all other buffers" })

-- ==========================================
-- 4. PLUGIN MANAGER (Lazy.nvim) BOOTSTRAP
-- ==========================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ==========================================
-- 5. SETUP PLUGINS
-- ==========================================
-- This tells lazy to look inside the `lua/plugins` folder for your plugins
require("lazy").setup("plugins")

-- Treesitter setup
require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})
