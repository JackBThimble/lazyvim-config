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
  pattern = "Makefile",
  callback = function()
    vim.opt_local.shiftwidth = 8
    vim.opt_local.softtabstop = 8
    vim.opt_local.shiftround = false
    vim.opt_local.tabstop = 8
    vim.o.expandtab = false
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

autocmd("FileType", {
  pattern = {
    "go",
  },
  callback = function()
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.shiftround = true
  end,
})

vim.api.nvim_create_user_command("Make", function(params)
  local cmd, num_subs = vim.o.makeprg:gsub("%S%*", params.args)
  if num_subs == 0 then
    cmd = cmd .. " " .. params.args
  end
  local task = require("overseer").new_task({
    cmd = vim.fn.expandcmd(cmd),
    components = {
      { "on_output_quickfix", open = not params.bang, open_height = 8 },
      "default",
    },
  })
  task:start()
end, {
  desc = "Run your makeprg as an Overseer task",
  nargs = "*",
  bang = true,
})
