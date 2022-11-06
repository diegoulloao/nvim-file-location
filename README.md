```bash
  __ _ _        _                 _   _             
 / _(_) | ___  | | ___   ___ __ _| |_(_) ___  _ __  
| |_| | |/ _ \ | |/ _ \ / __/ _` | __| |/ _ \| '_ \ 
|  _| | |  __/ | | (_) | (_| (_| | |_| | (_) | | | |
|_| |_|_|\___| |_|\___/ \___\__,_|\__|_|\___/|_| |_|

```
Simple Nvim plugin that copies the exact file location where the cursor is 😼 - Written in lua.

----

![nvim-file-location](https://user-images.githubusercontent.com/45423661/200167439-cbdc2a41-8e45-466b-b74c-83a8b474a24b.gif)

# 1. Prerequisites
Make sure to have the clipboard enabled in your vim configuation:

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

# 2. Installation

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

# 3. Usage
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
})
```

### modes [string]
- workdir: `pages/index.ts:25`
- absolute: `/Users/diego/Desktop/next-js-app/pages/index.ts:25`

### add_line [boolean]
Let's take the workdir mode for this example:

- `true`: `pages/index.ts:25`
- `false`: `pages/index.ts`

**Defaults options:**
```lua
{
  keymap = "<leader>L",
  mode = "workdir",
  add_line = true,
}
```

**Vimscript**
```vim
lua << EOF
  require("nvim-file-location").setup()
EOF
```

# 4. Integrations
**[nvim-notify](https://github.com/rcarriga/nvim-notify)**

It's highly recommended to use it togheter with nvim-notify in order to get nice notifications 😍

---
**diegoulloao · 2022**
