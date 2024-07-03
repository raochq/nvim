
function LspKeybind(client, bufnr)
	-- 禁用格式化功能，交给专门插件插件处理
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	-- 绑定快捷键
	require("keybind").mapLSP(buf_set_keymap)
end


return {
  "neovim/nvim-lspconfig",
  config = function()
    local nvim_lsp = require("lspconfig")
    nvim_lsp.gopls.setup {
      on_attach = LspKeybind,
    }
  end,
}
