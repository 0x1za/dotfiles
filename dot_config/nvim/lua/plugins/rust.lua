-- The Rust extra hands rust-analyzer to rustaceanvim, so settings go here
-- rather than in nvim-lspconfig's `servers` table.
return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        settings = function(project_root, default_settings)
          local settings = vim.deepcopy(default_settings)
          -- Support non-Cargo projects that describe themselves with rust-project.json
          local rust_project = vim.fs.joinpath(project_root, "rust-project.json")
          if vim.uv.fs_stat(rust_project) then
            settings["rust-analyzer"].linkedProjects = { rust_project }
          end
          return settings
        end,
      },
    },
  },
}
