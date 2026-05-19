return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader><CR>",
      function()
        Snacks.terminal(nil, {
          count = 1,
          win = { position = "float" },
        })
      end,
      desc = "Toggle Floating Terminal",
      mode = { "n", "t" },
    },
    {
      "<leader>j",
      function()
        Snacks.terminal(nil, {
          count = 2,
          win = { style = "terminal_bottom", position = "bottom" },
        })
      end,
      desc = "Toggle Bottom Terminal",
      mode = { "n", "t" },
    },
  },
  opts = {
    styles = {
      terminal_bottom = {
        style = "terminal",
        keys = {
          term_normal = {
            "<esc>",
            function()
              vim.cmd("stopinsert")
            end,
            mode = "t",
            desc = "Escape to normal mode",
          },
        },
      },
    },
    terminal = {
      win = {
        style = "terminal",
        border = "rounded",
        title = "Terminal",
        title_pos = "center",
      },
    },
  },
}
