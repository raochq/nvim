-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)
map("n", "g_", "$", opt)

-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)

-- fix :set wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
map("n", "qq", ":q!<CR>", opt)
map("n", "<leader>q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
-- map("i", "<C-h>", "<ESC>I", opt)
-- map("i", "<C-l>", "<ESC>A", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others
-- Ctrl + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
-- <Ctrl> + 箭头 窗口之间跳转
map("n", "<C-Left>", "<C-w>h", opt)
map("n", "<C-Down>", "<C-w>j", opt)
map("n", "<C-Up>", "<C-w>k", opt)
map("n", "<C-Right>", "<C-w>l", opt)
-- 左右比例控制
map("n", "<S-C-A-Left>", ":vertical resize -2<CR>", opt)
map("n", "<S-C-A-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -10<CR>", opt)
map("n", "s.", ":vertical resize +10<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<S-C-A-Down>", ":resize +2<CR>", opt)
map("n", "<S-C-A-Up>", ":resize -2<CR>", opt)
-- 相等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
map("n", "st", ":sp | terminal<CR>", opt)
map("n", "stv", ":vsp | terminal<CR>", opt)
-- Esc 回 Normal 模式
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)
--------------------------------------------------------------------
-- 修改跳转
map("n", "<C-A-Left>", "<C-o>", opt)
map("n", "<C-A-Right>", "<C-i>", opt)
-- 插件快捷键
-- nvim-tree
map("n", "<C-b>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>b", ":NvimTreeToggle<CR>", opt)
-- bufferline
-- 左右Tab切换
map("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-Left>", ":bprevious<CR>", opt)
map("n", "<C-Tab>", ":BufferLineCycleNext<CR>", opt)
map("n", "<A-Right>", ":bnext<CR>", opt)
-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<leader>bc", ":bdelete!<CR>", opt)
map("n", "<C-w>", ":bdelete!<CR>", opt)
-- 关闭左/右侧标签页
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- 关闭其他标签页
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- 关闭选中标签页
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)

local pluginKeys = {}
-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
-- pluginKeys.comment = {
--   -- Normal 模式快捷键
--   toggler = {
--     line = "gcc", -- 行注释
--     block = "gbc", -- 块注释
--   },
--   -- Visual 模式
--   opleader = {
--     line = "gc",
--     bock = "gb",
--   },
-- }
-- ctrl + /
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gcc", { noremap = false })
map("i", "<C-_>", "<ESC>gcc", { noremap = false })

-- 列表快捷键
pluginKeys.nvimTreeList = { -- 打开文件或文件夹
  { key = { "o", "<2-LeftMouse>" }, action = "edit" },
  { key = "<CR>",                   action = "system_open" },
  -- v分屏打开文件
  { key = "v",                      action = "vsplit" },
  -- h分屏打开文件
  { key = "h",                      action = "split" },
  -- Ignore (node_modules)
  { key = "i",                      action = "toggle_ignored" },
  -- Hide (dotfiles)
  { key = ".",                      action = "toggle_dotfiles" },
  { key = "R",                      action = "refresh" },
  -- 文件操作
  { key = "a",                      action = "create" },
  { key = "d",                      action = "remove" },
  { key = "r",                      action = "rename" },
  { key = "x",                      action = "cut" },
  { key = "c",                      action = "copy" },
  { key = "p",                      action = "paste" },
  { key = "y",                      action = "copy_name" },
  { key = "Y",                      action = "copy_path" },
  { key = "gy",                     action = "copy_absolute_path" },
  { key = "I",                      action = "toggle_file_info" },
  { key = "n",                      action = "tabnew" },
  -- 进入下一级
  { key = { "]" },                  action = "cd" },
  -- 进入上一级
  { key = { "[" },                  action = "dir_up" },
}
-- Telescope 列表中 插入模式快捷键
-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
map("i", "<C-f>", "<ESC>:Telescope live_grep<CR>", opt)
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<C-n>"] = "move_selection_next",
    ["<C-p>"] = "move_selection_previous",
    -- 历史记录
    ["<C-Down>"] = "cycle_history_next",
    ["<C-Up>"] = "cycle_history_prev",
    -- 关闭窗口
    -- ["<esc>"] = actions.close,
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down", 
  },
}
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  -- mapbuf("n", "<leader>rn", ":Lspsaga rename<CR>", opt)
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)

  -- code action
  -- mapbuf("n", "<leader>ca", ":Lspsaga code_action<CR>", opt)
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)

  -- hover
  -- mapbuf("n", "gh", ":Lspsaga hover_doc<cr>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)

  -- go to definition
  -- mapbuf('n', 'gd', ":Lspsaga goto_definition<CR>", opt)
  -- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gd", ":Telescope lsp_definitions initial_mode=normal <CR>", opt)
  mapbuf("n", "<F12>", ":Telescope lsp_definitions initial_mode=normal <CR>", opt)
  mapbuf("i", "<F12>", "<ESC>:Telescope lsp_definitions initial_mode=normal <CR>", opt)
  mapbuf("n", "<S-F12>", ":Telescope lsp_type_definitions<CR>", opt)
  mapbuf("i", "<S-F12>", "<ESC>:Telescope lsp_type_definitions<CR>", opt)
  -- mapbuf('n', 'gt', ":Lspsaga peek_definition<CR>", opt)
  -- mapbuf('n', 'gT', ":Lspsaga peek_type_definition<CR>", opt)
  -- mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)


  -- implementation
  mapbuf("n", "<C-S-o>", ":Telescope lsp_document_symbols<CR>", opt)
  mapbuf("i", "<C-S-o>", "<ESC>:Telescope lsp_document_symbols<CR>", opt)
  mapbuf("n", "<C-t>", ":Telescope lsp_dynamic_workspace_symbols<CR>", opt)
  mapbuf("i", "<C-t>", "<ESC>:Telescope lsp_dynamic_workspace_symbols<CR>", opt)
  mapbuf("n", "<A-F12>", ":Telescope lsp_implementations<CR>", opt)
  mapbuf("n", "gi", ":Telescope lsp_implementations<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)

  -- references
  mapbuf("n", "gr", ":Telescope lsp_references<CR>", opt)
  mapbuf("n", "<C-F12>", ":Telescope lsp_references<CR>", opt)
  mapbuf("i", "<C-F12>", "<ESC>:Telescope lsp_references<CR>", opt)
  -- mapbuf("n", "gf", ":Lspsaga finder def+ref<CR>", opt)
  -- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)

  --[[
  Lspsaga 替换 gp, gj, gk
  --]]
  mapbuf("n", "gp", ":lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", ":lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", ":lua vim.diagnostic.goto_prev()<CR>", opt)
  --[[
  -- diagnostic
  mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  --]]
  -- 未用
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

return pluginKeys
