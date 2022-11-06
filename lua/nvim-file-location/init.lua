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
  local file_location = FileLocation.get_file_location(global_config.mode, global_config.add_line)
  utils.copy_to_clipboard(file_location)
end

-- get file location
function FileLocation.get_file_location(mode, add_line)
  -- add defaults for optional parameters
  mode = (mode == nil and global_config.mode) or mode
  add_line = (add_line == nil and global_config.add_line) or add_line

  return utils.get_file_location(mode, add_line)
end

-- export plugin
return FileLocation
