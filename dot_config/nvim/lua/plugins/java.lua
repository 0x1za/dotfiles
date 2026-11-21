-- jdtls 1.63+ needs Java 25; repos with direnv (e.g. kaizo's bazel_env) put an older java first on PATH.
local java_home = "/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"

if vim.fn.executable(java_home .. "/bin/java") == 0 then
  vim.notify("jdtls needs Java 25+: brew install openjdk", vim.log.levels.WARN)
end

vim.lsp.config("jdtls", { cmd_env = { JAVA_HOME = java_home } })

return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      jdtls = { cmd_env = { JAVA_HOME = java_home } },
    },
  },
}
