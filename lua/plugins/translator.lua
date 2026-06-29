return {
  "voldikss/vim-translator",
  keys = {
    { "<leader>j", "<Plug>TranslateWV", mode = "x", desc = "翻译选中" },
  },
  init = function()
    vim.g.translator_target_lang = "zh"
    vim.g.translator_source_lang = "auto"
    vim.g.translator_default_engines = { "google", "youdao", "bing" }
    vim.g.translator_window_type = "popup"
    vim.g.translator_window_max_width = 0.6
    vim.g.translator_window_max_height = 0.6
  end,
}
