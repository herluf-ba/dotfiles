-- set tab with to 4 and use spases
vim.cmd[[
  set expandtab
  set softtabstop=4
  set tabstop=4
]];

vim.opt.relativenumber = true

-- Only close current fold when doing zc first time
vim.opt.foldlevel = 20

-- Dont double show mode
vim.cmd [[ 
  set noshowmode
  set nofoldenable
]]

-- Split below and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Navigate tabs with meta arrows
vim.keymap.set('n', '<m-left>', 'gT')
vim.keymap.set('n', '<m-right>', 'gt')

-- Setup buffer line for tab styling
require('bufferline').setup({
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
    mode = 'tabs'
  },
  highlights = {
    buffer_selected = {
      italic = false,
      bold = false,
    }
  }
})



-- Toggle background = [dark/light]
local function toggle_background()
  if vim.opt.background:get() == "dark" then
    vim.opt.background = 'light'
  else
    vim.opt.background = 'dark'
  end
end

vim.keymap.set('n', '<leader>tb', toggle_background, { desc = "[T]oggle [b]ackground (light/dark)" })
