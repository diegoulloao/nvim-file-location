--------
-- module utils
-- @module Utils
local Utils = {}

--------
-- returns the file location
-- @param mode string
-- @param add_line boolean
-- @return file_location string
function Utils.get_file_location(mode, add_line)
  local absolute_file_location = vim.fn.expand("%")

  -- absolute path / no line
  if mode == "absolute" and not add_line then
    return absolute_file_location
  end

  local current_file_line = vim.fn.line(".")

  -- absolute path / with line
  if mode == "absolute" then
    return absolute_file_location .. ":" .. current_file_line
  end

  local work_directory = vim.fn.getcwd()
  local project_file_location = absolute_file_location:gsub(work_directory:gsub("%-", "%%-") .. "/", "")

  -- workdir path / no line
  if not add_line then
    return project_file_location
  end

  -- workdir path / with line
  return project_file_location .. ":" .. current_file_line
end

--------
-- copies the file location to the clipboard
-- @param file_location string
-- @return nil
function Utils.copy_to_clipboard(file_location)
  local status, _ = pcall(vim.cmd, string.format([[ let @*="%s" ]], file_location))
  if not status then
    vim.notify("Error: Location could not be copied.", vim.log.levels.ERROR, { title = "File Location" })
    return
  end

  vim.notify("Copied to your clipboard!", vim.log.levels.INFO, { title = "File Location" })
end

-- export module utils
return Utils
