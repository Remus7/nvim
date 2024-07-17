return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim",

  ft = { "python", "typescript", "typescriptreact", "typescript.tsx" },
  dependencies = {
    "mfussenegger/nvim-jdtls",
    "williamboman/mason.nvim",
  },
  config = function()
    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          -- Ensure that sonarlint-language-server uses stdio channel
          "-stdio",
          "-analyzers",
          -- paths to the analyzers you need, using those for python and java in this example
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
        },
      },
      filetypes = {
        "python",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
    })
  end,
}
