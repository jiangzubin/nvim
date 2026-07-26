local rust_analyzer = vim.fn.expand("~/.local/bin/rust-analyzer-standalone")

return {
  "mrcjkb/rustaceanvim",
  opts = function(_, opts)
    opts.server = opts.server or {}
    opts.server.cmd = { rust_analyzer }
    opts.server.settings = opts.server.settings or {}
    opts.server.settings["rust-analyzer"] = opts.server.settings["rust-analyzer"] or {}
    opts.server.settings["rust-analyzer"].procMacro = {
      enable = true,
    }
    opts.server.settings["rust-analyzer"].diagnostics = {
      enable = true,
      disabled = { "unresolved-proc-macro" },
      enableExperimental = false,
    }
    return opts
  end,
}
