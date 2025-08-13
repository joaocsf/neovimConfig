local M = {}
local sign_define = vim.fn.sign_define
local map = vim.keymap.set

local ok_telescope, telescope = pcall(require, 'telescope.builtin')
local ok_conform, conform = pcall(require, 'conform')

local function custom_format()
  if ok_conform then
    conform.format()
  else
    vim.lsp.buf.format()
  end
end

local function lsp_highlight_document(client)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
    vim.api.nvim_create_autocmd('CursorHold', {
      group = 'lsp_document_highlight',
      pattern = '<buffer>',
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      pattern = '<buffer>',
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local float_opts = {
  border = 'rounded',
  max_width = 90,
}

function M.setup()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '󰌵' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  vim.diagnostic.config {
    virtual_text = true,
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = true,
      header = '',
      prefix = '',
    },
  }
end

M.on_attach = function(client, bufnr)
  map('n', 'gh', (function()
    local lastDiagnosticBuffer = nil
    return function()
      local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
      lastDiagnosticBuffer = vim.api.nvim_buf_is_valid(lastDiagnosticBuffer or -1) and lastDiagnosticBuffer or nil
      if (#vim.diagnostic.get(0, { lnum = line - 1, severity = { min = vim.diagnostic.severity.HINT } }) > 0
          and lastDiagnosticBuffer == nil) then
        lastDiagnosticBuffer, _ = vim.diagnostic.open_float()
      else
        vim.lsp.buf.hover(float_opts)
      end
    end
  end)(), { desc = 'Hover symbol details', buffer = bufnr })
  map('n', 'gH', function()
    vim.lsp.buf.hover(float_opts)
  end, { desc = 'Hover symbol details', buffer = bufnr })
  map('n', '<leader>la', function()
    vim.lsp.buf.code_action()
  end, { desc = 'LSP code action', buffer = bufnr })
  map('n', '<leader>lf', custom_format, { desc = 'Format code', buffer = bufnr })
  map('n', '<leader>lh', function()
    vim.lsp.buf.signature_help(float_opts)
  end, { desc = 'Signature help', buffer = bufnr })
  map('n', '<leader>lH', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { desc = 'Toggle Inlay Hints', buffer = bufnr })
  map('i', '<C-h>', function()
    vim.lsp.buf.signature_help(float_opts)
  end, { desc = 'Signature help', buffer = bufnr })
  map('n', '<leader>lr', function()
    vim.lsp.buf.rename()
  end, { desc = 'Rename current symbol', buffer = bufnr })
  map('n', 'gD', function()
    vim.lsp.buf.declaration()
  end, { desc = 'Declaration of current symbol', buffer = bufnr })
  map('n', 'gI', function()
    if ok_telescope then
      telescope.lsp_implementations { show_line = false }
    else
      vim.lsp.buf.implementation()
    end
  end, { desc = 'Implementation of current symbol', buffer = bufnr })
  map('n', 'gd', function()
    if ok_telescope then
      telescope.lsp_definitions { show_line = false }
    else
      vim.lsp.buf.definition()
    end
  end, { desc = 'Show the definition of current symbol', buffer = bufnr })
  map('n', 'gr', function()
    if ok_telescope then
      telescope.lsp_references { show_line = false }
    else
      vim.lsp.buf.references()
    end
  end, { desc = 'References of current symbol', buffer = bufnr })
  map('n', '<leader>ld', function()
    vim.diagnostic.open_float()
  end, { desc = 'Hover diagnostics', buffer = bufnr })

  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,    { desc = 'Add Workspace', buffer = bufnr })
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove Workspace', buffer = bufnr })
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = 'List Workspaces', buffer = bufnr })

  map('n', '[d', function()
    vim.diagnostic.jump { count = -1 }
  end, { desc = 'Previous diagnostic', buffer = bufnr })
  map('n', ']d', function()
    vim.diagnostic.jump { count = 1 }
  end, { desc = 'Next diagnostic', buffer = bufnr })
  map('n', 'gl', function()
    vim.lsp.codelens.run()
  end, { desc = 'Condelens run', buffer = bufnr })
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', custom_format, { desc = 'Format file with LSP' })

  local autocmd = vim.api.nvim_create_autocmd
  local augroup = vim.api.nvim_create_augroup

  local group = augroup('Auto Format on Save', { clear = true })
  autocmd('BufWritePre', {
    callback = custom_format,
    group = group,
  })

  lsp_highlight_document(client)
end

return M
