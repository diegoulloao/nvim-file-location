-- reset plugin packages
package.loaded["nvim-file-location"] = nil
package.loaded["nvim-file-location.config"] = nil
package.loaded["nvim-file-location.utils"] = nil

-- reset development bootstrap
package.loaded["dev"] = nil

-- require file location plugin safe
local status, FileLocation = pcall(require, "nvim-file-location")
if not status then
	vim.notify("No module detected", vim.log.levels.ERROR, { title = "File Location" })
	return
end

-- set development keymaps
vim.keymap.set("n", "<leader>rr", "<cmd>luafile dev/init.lua<cr>")

-- Init plugin
FileLocation.setup({
	-- user options
})

-- success message
vim.notify("Plugin reloaded!", vim.log.levels.INFO, { title = "Dev" })
