local default_config = {
  keymaps = {
    accept_suggestion = "<C-j>",
    clear_suggestion = "<C-]>",
    accept_word = "<A-j>",
  },
  filetypes = {},
  ignore_filetypes = {},
  disable_inline_completion = false,
  disable_keymaps = false,
  condition = function()
    return false
  end,
  log_level = "error",
  color = {
    suggestion_color = "#928374",
    cterm = 245,
  },
}

local M = {
  config = vim.deepcopy(default_config),
}

M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", vim.deepcopy(default_config), args)
end

return setmetatable(M, {
  __index = function(_, key)
    if key == "setup" then
      return M.setup
    end
    return rawget(M.config, key)
  end,
})
