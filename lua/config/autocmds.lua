-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = {
    "c",
    "cpp",
    "Makefile",
    "s",
    "asm",
    "S",
  },
  callback = function()
    vim.opt_local.softtabstop = 8
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
    vim.opt_local.shiftround = true
  end,
})

autocmd("FileType", {
  pattern = {
    "js",
    "ts",
    "html",
    "css",
    "yaml",
    "json",
    "py",
  },
  callback = function()
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.shiftround = true
  end,
})
