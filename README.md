```bash
  __ _ _        _                 _   _
 / _(_) | ___  | | ___   ___ __ _| |_(_) ___  _ __
| |_| | |/ _ \ | |/ _ \ / __/ _` | __| |/ _ \| '_ \
|  _| | |  __/ | | (_) | (_| (_| | |_| | (_) | | | |
|_| |_|_|\___| |_|\___/ \___\__,_|\__|_|\___/|_| |_|

```

| Simple nvim plugin that copies the exact file location where the cursor is · written in lua 😼 |

---

![nvim-file-location](https://user-images.githubusercontent.com/45423661/200167439-cbdc2a41-8e45-466b-b74c-83a8b474a24b.gif)

# 1. Prerequisites 📦

Make sure to have the clipboard enabled in your nvim configuration:

**Lua**

```lua
-- clipboard
vim.opt.clipboard:append("unnamedplus")
```

**Vimscript**

```vim
" clipboard
set clipboard=unnamedplus
```

# 2. Installation ⚡️

**Packer**

```lua
use("diegoulloao/nvim-file-location")
```

**Dein**

```vim
call dein#call("diegoulloao/nvim-file-location")
```

**Plug**

```vim
Plug "diegoulloao/nvim-file-location"
```

# 3. Usage ✨

Call the setup function passing your custom options inside the table if necessary:

**Lua**

```lua
-- require plugin
local status, nvim_file_location = pcall(require, "nvim-file-location")
if not status then
  return
end

-- custom config
nvim_file_location.setup({
  keymap = "<leader>L",
  mode = "workdir", -- options: workdir | absolute
  add_line = true,
  add_column = false,
  default_register = "*",
})
```

### mode [string]

- workdir: `pages/index.ts:25`
- absolute: `/Users/diego/Desktop/next-js-app/pages/index.ts:25`

### add_line [boolean]

Let's take the workdir mode for this example:

- `true`: `pages/index.ts:25`
- `false`: `pages/index.ts`

### add_column [boolean]

It works only if `add_line` is `true`

Let's take the workdir mode for this example:

- `true`: `pages/index.ts:25:11`
- `false`: `pages/index.ts:25`

### register [string]

The register to use (default is the global system register `"*"`)

**Defaults options:**

```lua
{
  keymap = "<leader>L",
  mode = "workdir",
  add_line = true,
  add_column = false,
  default_register = "*",
}
```

**Vimscript**

```vim
lua << EOF
  require("nvim-file-location").setup()
EOF
```

## Custom keymaps

To add keymaps for differents modes do it like:

**Lua**

```lua
vim.keymap.set("n", "<leader>fl",  "<cmd>lua NvimFileLocation.copy_file_location('absolute', true, false)<cr>")
```

**Vimscript**

```vim
nnoremap <leader>fl :lua NvimFileLocation.copy_file_location("absolute", true, false)<cr>
```

Where params are (optional):

```lua
NvimFileLocation.copy_file_location(mode, add_line, add_column, register)
```

# 4. Integrations 💎

**[nvim-notify](https://github.com/rcarriga/nvim-notify)**

It's highly recommended to use it together with nvim-notify in order to get nice notifications 😍

# 5. Changelog 📋

All notable changes are listed here: [changelog](https://github.com/diegoulloao/nvim-file-location/blob/main/CHANGELOG.md)

---

**diegoulloao · 2023**
