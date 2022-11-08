---------
-- @brief [[
-- Plugin that copies the exact file location where the cursor is
-- @brief ]]

--------
-- @tag nvim-file-location

-- require
local config = require("nvim-file-location.config")
local utils = require("nvim-file-location.utils")

-- plugin config
local global_config

--------
-- main module
-- @module FileLocation
local FileLocation = {}
FileLocation._VERSION = "1.1.0"

--------
-- setup plugin
-- @param user_config table
-- @return nil
function FileLocation.setup(user_config)
  global_config = FileLocation.config(user_config)

  -- set keymap
  vim.keymap.set("n", global_config.keymap, FileLocation.copy_file_location)
end

--------
-- config plugin
-- @param user_config table
-- @return config table
function FileLocation.config(user_config)
  return config.setup(user_config)
end

--------
-- copy file location
-- @param mode string
-- @param add_line boolean
-- @param add_column boolean
-- @return nil
function FileLocation.copy_file_location(mode, add_line, add_column)
  print(mode)
  -- add defaults for optional parameters
  mode = (mode == nil and global_config.mode) or mode
  add_line = (add_line == nil and global_config.add_line) or add_line
  add_column = (add_column == nil and global_config.add_column) or add_column

  local file_location = FileLocation.get_file_location(mode, add_line, add_column)
  utils.copy_to_clipboard(file_location)
end

--------
-- get file location
-- @param mode string
-- @param add_line boolean
-- @param add_column boolean
-- @return file_location string
function FileLocation.get_file_location(mode, add_line, add_column)
  -- add defaults for optional parameters
  mode = (mode == nil and global_config.mode) or mode
  add_line = (add_line == nil and global_config.add_line) or add_line
  add_column = (add_column == nil and global_config.add_column) or add_column

  return utils.get_file_location(mode, add_line, add_column)
end

--------
-- globally exposed file location functions
-- @global
NvimFileLocation = {
  copy_file_location = FileLocation.copy_file_location,
}

-- export plugin
return FileLocation
