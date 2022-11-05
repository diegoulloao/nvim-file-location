-- require
local config = require("nvim-file-location.config")
local utils = require("nvim-file-location.utils")

-- plugin config
local global_config

-- main module
local FileLocation = {}

-- setup plugin
function FileLocation.setup(user_config)
	global_config = FileLocation.config(user_config)

	-- set keymap
	vim.keymap.set("n", global_config.keymap, FileLocation.copy_file_location)
end

-- config plugin
function FileLocation.config(user_config)
	return config.setup(user_config)
end

-- copy file location
function FileLocation.copy_file_location()
	local path_to_file_line = FileLocation.get_path_to_file_line(global_config.mode, global_config.add_line)
	utils.copy_to_clipboard(path_to_file_line)
end

-- get path to file
function FileLocation.get_path_to_file_line(mode, add_line)
	return utils.get_path_to_file_line(mode, add_line)
end

-- export plugin
return FileLocation
