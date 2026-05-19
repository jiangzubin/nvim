local has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then
    return false
  end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match("%s") == nil
end

return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "none",
      ["<CR>"] = { "accept", "select_next", "fallback" },
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active({ direction = 1 }) then
            return cmp.snippet_forward()
          end
        end,
        "select_next",
        function(cmp)
          if has_words_before() then
            return cmp.show()
          end
        end,
        "fallback",
      },

      ["<S-Tab>"] = {
        function(cmp)
          if cmp.snippet_active({ direction = -1 }) then
            return cmp.snippet_backward()
          end
        end,
        "select_prev",
        "fallback",
      },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      menu = {
        max_height = 20,
        border = "rounded",
        auto_show = false,
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
          },
        },
      },
      documentation = { window = { border = "rounded" }, auto_show = true },
    },
    signature = { enabled = false, window = { border = "rounded" } },
  },
}
