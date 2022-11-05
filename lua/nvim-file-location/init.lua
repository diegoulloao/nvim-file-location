-- require
local config = require("nvim-file-location.config")
local utils = require("nvim-file-location.utils")

-- plugin config
local global_config

-- main module
local FileLocation = {}

-- main function
function FileLocation.copy_file_location()
	local path_to_file_line = utils.get_path_to_file_line()
	utils.copy_to_clipboard(path_to_file_line)
end

-- config plugin
function FileLocation.config(user_config)
	return config.setup(user_config)
end

-- setup plugin
function FileLocation.setup(user_config)
	global_config = FileLocation.config(user_config)

	-- set keymap
	vim.keymap.set("n", global_config.keymap, FileLocation.copy_file_location)
end

-- get path to file
function FileLocation.get_path_to_file_line()
	return utils.get_path_to_file_line()
end

-- export plugin
return FileLocation
