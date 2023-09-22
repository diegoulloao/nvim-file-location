--------
-- module utils
-- @module Utils
local Utils = {}

--------
-- returns the file location
-- @param mode string
-- @param add_line boolean
-- @param add_column boolean
-- @return file_location string
function Utils.get_file_location(mode, add_line, add_column)
  -- absolute file location
  local absolute_file_location = vim.fn.expand("%:p")

  -- absolute path / no line
  if mode == "absolute" and not add_line then
    return absolute_file_location
  end

  -------- has line *

  -- current line
  local current_file_line = vim.fn.line(".")

  -- absolute path / with line
  if mode == "absolute" and not add_column then
    return absolute_file_location .. ":" .. current_file_line
  end

  -------- has column *

  -- current column
  local current_file_column = vim.fn.col(".")

  if mode == "absolute" then
    return absolute_file_location .. ":" .. current_file_line .. ":" .. current_file_column
  end

  -------- mode is workdir *

  -- workdir directory
  local work_directory = vim.fn.getcwd()

  -- project file location
  local project_file_location = absolute_file_location:gsub(work_directory:gsub("%-", "%%-") .. "/", "")

  -- workdir path / no line
  if not add_line then
    return project_file_location
  end

  --------- has line *

  -- workdir path / with line / no column
  if not add_column then
    return project_file_location .. ":" .. current_file_line
  end

  -------- has column *

  return project_file_location .. ":" .. current_file_line .. ":" .. current_file_column
end

--------
-- copies the file location to the clipboard
-- @param file_location string
-- @return nil
function Utils.copy_to_clipboard(file_location, register)
  local status, _ = pcall(vim.fn.setreg, register, file_location)
  if not status then
    vim.notify("Error: Location could not be copied.", vim.log.levels.ERROR, { title = "File Location" })
    return
  end

  vim.notify("Copied to your clipboard!", vim.log.levels.INFO, { title = "File Location" })
end

-- export module utils
return Utils
