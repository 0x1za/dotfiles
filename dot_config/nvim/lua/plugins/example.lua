-- stylua: ignore
return {
    -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },
  {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rust_analyzer = {
        root_dir = require('lspconfig.util').root_pattern('rust-project.json', 'Cargo.toml'),
        settings = {
          ['rust-analyzer'] = {
            linkedProjects = function()
              local root = require('lspconfig.util').root_pattern('rust-project.json')(vim.fn.getcwd())
              if root then
                return { root .. '/rust-project.json' }
              end
            end
          }
        }
      }
    }
  }
  },
  { 'wakatime/vim-wakatime', lazy = false }
}
