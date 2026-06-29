-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.cursorline = false
opt.mouse = ""
vim.g.snacks_animate = false

-- 通过 OrbStack 的 mac pbcopy/pbpaste 桥接 macOS 宿主机系统剪贴板。
-- 原因:SSH 远程 + macOS Terminal.app 不支持 OSC52,nvim 默认无法把
-- yy 的内容送回宿主机剪贴板;改用 OrbStack 的 mac 命令直连宿主机剪贴板。
vim.g.clipboard = {
  name = "orbstack-mac",
  copy = { ["+"] = { "mac", "pbcopy" }, ["*"] = { "mac", "pbcopy" } },
  paste = { ["+"] = { "mac", "pbpaste" }, ["*"] = { "mac", "pbpaste" } },
  cache_enabled = 0,
}
-- 覆盖 LazyVim 在 SSH 会话下把 clipboard 置空的默认,让 yy/p 直接走系统剪贴板。
opt.clipboard = "unnamedplus"
