-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Cargo shortcuts for Rust buffers, run in a Snacks terminal from the Cargo root
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("cargo_keymaps", { clear = true }),
  pattern = "rust",
  callback = function(ev)
    local function cargo(args)
      return function()
        local cargo_toml = vim.fs.find("Cargo.toml", { upward = true, path = vim.fs.dirname(ev.file) })[1]
        local cwd = cargo_toml and vim.fs.dirname(cargo_toml) or vim.fn.getcwd()
        vim.cmd("silent! wall")
        -- reuse a single terminal: close the previous cargo run before starting a new one
        if CargoTerm and CargoTerm:buf_valid() then
          CargoTerm:close({ buf = true })
        end
        local editor_win = vim.api.nvim_get_current_win()
        CargoTerm = Snacks.terminal.open({ "cargo", unpack(args) }, {
          cwd = cwd,
          interactive = false,
          auto_close = false,
          win = { position = "bottom", height = 0.4 },
        })
        -- stay in the editor; the terminal just shows output
        if vim.api.nvim_win_is_valid(editor_win) then
          vim.api.nvim_set_current_win(editor_win)
        end
      end
    end
    local map = function(lhs, args, desc)
      vim.keymap.set("n", lhs, cargo(args), { buffer = ev.buf, desc = desc })
    end
    map("<leader>rr", { "run" }, "Cargo run")
    map("<leader>rb", { "build" }, "Cargo build")
    map("<leader>rc", { "check" }, "Cargo check")
    map("<leader>rt", { "test" }, "Cargo test")
  end,
})
