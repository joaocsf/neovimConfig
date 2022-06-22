local M = {}
local sign_define = vim.fn.sign_define
local map = vim.keymap.set

function M.setup()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
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
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
  )
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
        vim.lsp.buf.hover()
      end
    end
  end)(), { desc = 'Hover symbol details', buffer = bufnr })
  map('n', 'gH', function()
    vim.lsp.buf.hover()
  end, { desc = 'Hover symbol details', buffer = bufnr })
  map('n', '<leader>la', function()
    vim.lsp.buf.code_action()
  end, { desc = 'LSP code action', buffer = bufnr })
  map('n', '<leader>lf', function()
    vim.lsp.buf.format()
  end, { desc = 'Format code', buffer = bufnr })
  map('n', '<leader>lh', function()
    vim.lsp.buf.signature_help()
  end, { desc = 'Signature help', buffer = bufnr })
  map('i', '<C-h>', function()
    vim.lsp.buf.signature_help()
  end, { desc = 'Signature help', buffer = bufnr })
  map('n', '<leader>lr', function()
    vim.lsp.buf.rename()
  end, { desc = 'Rename current symbol', buffer = bufnr })
  map('n', 'gD', function()
    vim.lsp.buf.declaration()
  end, { desc = 'Declaration of current symbol', buffer = bufnr })
  map('n', 'gI', function()
    vim.lsp.buf.implementation()
  end, { desc = 'Implementation of current symbol', buffer = bufnr })
  map('n', 'gd', function()
    vim.lsp.buf.definition()
  end, { desc = 'Show the definition of current symbol', buffer = bufnr })
  map('n', 'gr', function()
    vim.lsp.buf.references()
  end, { desc = 'References of current symbol', buffer = bufnr })
  map('n', '<leader>ld', function()
    vim.diagnostic.open_float()
  end, { desc = 'Hover diagnostics', buffer = bufnr })

  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add Workspace', buffer = bufnr })
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove Workspace', buffer = bufnr })
  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = 'List Workspaces', buffer = bufnr })

  map('n', '[d', function()
    vim.diagnostic.goto_prev()
  end, { desc = 'Previous diagnostic', buffer = bufnr })
  map('n', ']d', function()
    vim.diagnostic.goto_next()
  end, { desc = 'Next diagnostic', buffer = bufnr })
  map('n', 'gl', function()
    vim.diagnostic.open_float()
  end, { desc = 'Hover diagnostics', buffer = bufnr })
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
    vim.lsp.buf.format()
  end, { desc = 'Format file with LSP' })

  local autocmd = vim.api.nvim_create_autocmd
  local augroup = vim.api.nvim_create_augroup

  local group = augroup('Auto Format on Save', { clear = true })
  autocmd('BufWritePre', {
    callback = function()
      vim.lsp.buf.format()
    end,
    group = group,
  })

  local ok_aerial, aerial = pcall(require, 'aerial')
  if ok_aerial then
    aerial.on_attach(client, bufnr)
  end

  lsp_highlight_document(client)

  local ok_lsp_signature, lsp_signature = pcall(require, 'lsp_signature')
  if ok_lsp_signature then
    lsp_signature.on_attach({
      bind = true,
      handlers_opts = {
        border = 'rounded'
      },
      hint_prefix = '• '
    }, bufnr)
  end

  local ok_navic, navic = pcall(require, 'nvim-navic')
  if ok_navic then
    vim.pretty_print(client.server_capabilities)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.preselectSupport = true
M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
M.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

return M
