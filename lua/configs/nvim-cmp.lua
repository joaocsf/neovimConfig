local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local ok_lspkind, lspkind = pcall(require, 'lspkind')

local formatFunction = function(_, vim_item)
  return vim_item
end

if ok_lspkind then
  formatFunction = lspkind.cmp_format {
    mode = 'symbol',
    maxwidth = 50,
    ellipsis_char = '...',
  }
end

local ok, cmp = pcall(require, 'cmp')
if ok then
  local ok_luasnip, luasnip = pcall(require, 'luasnip')

  local function has_words_before()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
  end

  -- `/` cmdline setup.
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
  -- `:` cmdline setup.
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      {
        name = 'cmdline',
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      }
    })
  })

  local i = 0
  cmp.setup {
    enabled = function()
      local ok_file, file_size_kb = pcall(function()
        return vim.loop.fs_stat(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())).size / 1024
      end)
      return (not ok_file) or file_size_kb < 512
    end,
    preselect = cmp.PreselectMode.Item,
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = formatFunction,
    },
    snippet = {
      expand = function(args)
        if ok_luasnip then
          luasnip.lsp_expand(args.body)
        end
      end
    },
    duplicates = {
      nvim_lsp = 1,
      cmp_tabnine = 1,
      buffer = 1,
      path = 1,
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      documentation = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      },
    },
    sources = {
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
      -- { name = 'cmdline' },
      -- { name = 'nvim_lsp_signature_help' },
    },
    mapping = {
      ['<Up>'] = cmp.mapping.select_prev_item(),
      ['<Down>'] = cmp.mapping.select_next_item(),
      -- ['<C-p>'] = cmp.mapping.select_prev_item(),
      -- ['<C-n>'] = cmp.mapping.select_next_item(),
      -- ["<C-k>"] = cmp.mapping.select_prev_item(),
      -- ["<C-j>"] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
      ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      ['<C-y>'] = cmp.mapping.confirm { select = false },
      ['<C-n>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif ok_luasnip and luasnip.expandable() then
          luasnip.expand {}
        elseif ok_luasnip and luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        'i',
        's',
      }),
      ['<C-p>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif ok_luasnip and luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        'i',
        's',
      }),
    },
  }

  autocmd('InsertLeave', {
    callback = function()
      if require 'luasnip'.session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require 'luasnip'.session.jump_active then
        require 'luasnip'.unlink_current()
      end
    end,
    group = augroup('Leave snippet', { clear = true }),
  })
end
