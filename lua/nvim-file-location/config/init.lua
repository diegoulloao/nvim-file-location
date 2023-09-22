--------
-- module config
-- @module Config
local Config = {}

-- default config
local default_config = {
  keymap = "<leader>L",
  mode = "workdir", -- options: workdir | absolute
  add_line = true,
  add_column = false,
  default_register = "*",
}

--------
-- setup config
-- @param user_config table
-- @return config table
function Config.setup(user_config)
  -- extend default config with user config
  local config = vim.tbl_deep_extend("keep", user_config or {}, default_config)
  return config
end

-- export module config
return Config
