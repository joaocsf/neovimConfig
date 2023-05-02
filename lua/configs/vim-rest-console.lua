local g = vim.g
local map = vim.keymap.set

g['vrc_set_default_mapping'] = 0
g['vrc_body_preprocessor'] = 'jq -c .'
g['vrc_show_command'] = 1
g['vrc_curl_opts'] = {
  ['-sS'] = ''
}
g['vrc_response_default_content_type'] = 'application/json'

map('n', '<C-q>', ':call VrcQuery()<cr>', { desc = 'Send Request', nowait = true, silent = true })
map('n', '<leader>rs', ':call VrcQuery()<cr>', { desc = 'Send Request', nowait = true, silent = true })
