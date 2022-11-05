-- module config
local Config = {}

-- default config
local default_config = {
	keymap = "<leader>L",
}

-- setup config
function Config.setup(user_config)
	-- extend default config with user config
	local config = vim.tbl_deep_extend("keep", user_config or {}, default_config)
	return config
end

-- export module config
return Config
