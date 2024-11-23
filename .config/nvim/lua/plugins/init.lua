return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  "neovim/nvim-lspconfig",

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    event = "User FilePost",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "tsx",
        "typescript",
        "javascript",
        "python",
        "sql",
        "json",
        "graphql",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "^.git/" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function(_)
            return { "--hidden" }
          end,
        },
        oldfiles = {
          cwd_only = true,
        },
      },
    },
  },

  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
}
