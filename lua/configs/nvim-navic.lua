local ok, navic = pcall(require, 'nvim-navic')

if ok then

  navic.setup {
    icons = {
      File          = ' ',
      Module        = ' ',
      Namespace     = ' ',
      Package       = ' ',
      Class         = ' ',
      Method        = ' ',
      Property      = ' ',
      Field         = ' ',
      Constructor   = ' ',
      Enum          = '練',
      Interface     = '練',
      Function      = ' ',
      Variable      = ' ',
      Constant      = ' ',
      String        = ' ',
      Number        = ' ',
      Boolean       = '◩ ',
      Array         = ' ',
      Object        = ' ',
      Key           = ' ',
      Null          = 'ﳠ ',
      EnumMember    = ' ',
      Struct        = ' ',
      Event         = ' ',
      Operator      = ' ',
      TypeParameter = ' ',
    },
    highlight = true,
    separator = ' > ',
    depth_limit = 0,
    depth_limit_indicator = '..',
  }

  local function hl(hlName)
    local result = { default = true }

    local ok_list, list = pcall(vim.api.nvim_get_hl_by_name, hlName, true)
    if ok_list then
      for k, v in pairs(list) do
        local name = k == 'background' and 'background' or 'fg'
        result[name] = string.format('#%06x', v)
      end
    end
    return result
  end

  local function aerialHL(name)
    return hl('Aerial' .. name .. 'Icon')
  end

  local function updateColors()
    vim.api.nvim_set_hl(0, 'NavicIconsArray', aerialHL 'Array')
    vim.api.nvim_set_hl(0, 'NavicIconsBoolean', aerialHL 'Boolean')
    vim.api.nvim_set_hl(0, 'NavicIconsClass', aerialHL 'Class')
    vim.api.nvim_set_hl(0, 'NavicIconsConstant', aerialHL 'Constant')
    vim.api.nvim_set_hl(0, 'NavicIconsConstructor', aerialHL 'Constructor')
    vim.api.nvim_set_hl(0, 'NavicIconsEnum', aerialHL 'Enum')
    vim.api.nvim_set_hl(0, 'NavicIconsEnumMember', aerialHL 'EnumMember')
    vim.api.nvim_set_hl(0, 'NavicIconsEvent', aerialHL 'Event')
    vim.api.nvim_set_hl(0, 'NavicIconsField', aerialHL 'Field')
    vim.api.nvim_set_hl(0, 'NavicIconsFile', aerialHL 'File')
    vim.api.nvim_set_hl(0, 'NavicIconsFunction', aerialHL 'Function')
    vim.api.nvim_set_hl(0, 'NavicIconsInterface', aerialHL 'Interface')
    vim.api.nvim_set_hl(0, 'NavicIconsKey', aerialHL 'Key')
    vim.api.nvim_set_hl(0, 'NavicIconsMethod', aerialHL 'Method')
    vim.api.nvim_set_hl(0, 'NavicIconsModule', aerialHL 'Module')
    vim.api.nvim_set_hl(0, 'NavicIconsNamespace', aerialHL 'Namespace')
    vim.api.nvim_set_hl(0, 'NavicIconsNull', aerialHL 'Null')
    vim.api.nvim_set_hl(0, 'NavicIconsNumber', aerialHL 'Number')
    vim.api.nvim_set_hl(0, 'NavicIconsObject', aerialHL 'Object')
    vim.api.nvim_set_hl(0, 'NavicIconsOperator', aerialHL 'Operator')
    vim.api.nvim_set_hl(0, 'NavicIconsPackage', aerialHL 'Package')
    vim.api.nvim_set_hl(0, 'NavicIconsProperty', aerialHL 'Property')
    -- vim.api.nvim_set_hl(0, 'NavicSeparator', hl 'Normal')
    vim.api.nvim_set_hl(0, 'NavicIconsString', aerialHL 'String')
    vim.api.nvim_set_hl(0, 'NavicIconsStruct', aerialHL 'Struct')
    vim.api.nvim_set_hl(0, 'NavicText', hl 'Normal')
    vim.api.nvim_set_hl(0, 'NavicIconsTypeParameter', aerialHL 'TypeParameter')
    vim.api.nvim_set_hl(0, 'NavicIconsVariable', aerialHL 'Variable')
  end

  local autocmd = vim.api.nvim_create_autocmd
  local augroup = vim.api.nvim_create_augroup

  local group = augroup('Update Colors', { clear = true })
  autocmd('ColorScheme', {
    callback = updateColors,
    group = group,
  })
  updateColors()


end
