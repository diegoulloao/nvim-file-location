-- copy path to file to the clipboard
local function copy_to_clipboard(path_to_file_line)
	local status, _ = pcall(vim.cmd, string.format([[ let @*="%s" ]], path_to_file_line))
	if not status then
		vim.notify("File location could not be copied.", vim.log.levels.ERROR, { title = "File Location" })
		return
	end

	vim.notify("Copied to your clipboard!", vim.log.levels.INFO, { title = "File Location" })
end

-- returns the file location including the line number
local function get_path_to_file_line()
	local absolute_file_location = vim.fn.expand("%")
	local work_directory = vim.fn.getcwd()
	local current_file_line = vim.fn.line(".")

	local project_file_location = absolute_file_location:gsub(work_directory:gsub("%-", "%%-") .. "/", "")
	return project_file_location .. ":" .. current_file_line
end

-- export utils
return {
	copy_to_clipboard = copy_to_clipboard,
	get_path_to_file_line = get_path_to_file_line,
}
