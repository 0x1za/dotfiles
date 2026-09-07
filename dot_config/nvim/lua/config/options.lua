-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Pin Neovim's Ruby environment to whatever version Mason used to compile ruby-lsp's
-- native extensions. Without this, switching RVM versions in the terminal causes
-- "linked to incompatible libruby" errors because .bundle files are compiled per-version.
-- Reads Mason's own environment file so this stays correct after Mason reinstalls.
local mason_env = vim.fn.expand("~/.local/share/nvim/mason/packages/ruby-lsp/environment")
if vim.fn.filereadable(mason_env) == 1 then
  for _, line in ipairs(vim.fn.readfile(mason_env)) do
    local ruby_bin = line:match("(/.+/rubies/ruby%-[%d%.]+/bin)")
    if ruby_bin then
      local gems_bin = ruby_bin:gsub("/rubies/", "/gems/")
      vim.env.PATH = ruby_bin .. ":" .. gems_bin .. ":" .. vim.env.PATH
      break
    end
  end
end
