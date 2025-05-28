local completion_preview = require("supermaven-nvim.completion_preview")
local log = require("supermaven-nvim.logger")
local config = require("supermaven-nvim.config")
local commands = require("supermaven-nvim.commands")
local api = require("supermaven-nvim.api")

local M = {}

M.setup = function(args)
  config.setup(args)

  if not config.disable_keymaps then
    if config.keymaps.accept_suggestion ~= nil then
      local accept_suggestion_key = config.keymaps.accept_suggestion
      vim.keymap.set(
        "i",
        accept_suggestion_key,
        completion_preview.on_accept_suggestion,
        { noremap = true, silent = true }
      )
    end

    if config.keymaps.accept_word ~= nil then
      local accept_word_key = config.keymaps.accept_word
      vim.keymap.set(
        "i",
        accept_word_key,
        completion_preview.on_accept_suggestion_word,
        { noremap = true, silent = true }
      )
    end

    if config.keymaps.clear_suggestion ~= nil then
      local clear_suggestion_key = config.keymaps.clear_suggestion
      vim.keymap.set("i", clear_suggestion_key, completion_preview.on_dispose_inlay, { noremap = true, silent = true })
    end
  end

  commands.setup()

  api.start()
end

return M
