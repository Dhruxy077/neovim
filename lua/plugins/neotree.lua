return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim", 
    },
    config = function()
      require("lsp-file-operations").setup()
      
      vim.keymap.set('n','<leader>e',':Neotree toggle<CR>',{desc = 'Neotree'})
      
      vim.keymap.set('n', '<leader>ge', function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end, { desc = "Git Explorer" })
      
      vim.keymap.set('n', '<leader>be', function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true })
      end, { desc = "Buffer Explorer" })
      
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          
          bo = {
             filetype = { "neo-tree", "neo-tree-popup", "notify" },
             buftype = { "terminal", "quickfix" },
          },
        },
      })
          end,
  },
}
