return {
  'sainnhe/gruvbox-material',
  priority = 1000,
  config = function()
    vim.opt.termguicolors = true
    vim.opt.background = 'dark'

    -- Настройки темы: ДО colorscheme
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_foreground = 'material'

    local c = {
      bg      = '#000000',
      red     = '#f16e65',
      green   = '#7ec97e',
      yellow  = '#ef934d',
      blue    = '#71b4d6',
      magenta = '#e28dc6',
      cyan    = '#7ec9a3',
      fg      = '#d9cdb5',
    }

    local function hl(group, opts)
      vim.api.nvim_set_hl(0, group, opts)
    end

    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('MyGruvboxOverride', { clear = true }),
      pattern = 'gruvbox-material',
      callback = function()
        hl('Normal',       { fg = c.fg, bg = c.bg })
        hl('NormalNC',     { fg = c.fg, bg = c.bg })
        hl('EndOfBuffer',  { fg = c.bg, bg = c.bg })
        hl('SignColumn',   { fg = c.fg, bg = c.bg })
        hl('LineNr',       { fg = '#555555', bg = c.bg })
        hl('CursorLineNr',  { fg = c.yellow, bg = c.bg, bold = true })
        hl('CursorLine',    { bg = '#111111' })
        hl('Visual',       { bg = '#1a1a1a' })

        hl('Comment',      { fg = c.cyan, italic = true })
        hl('String',       { fg = c.green })
        hl('Constant',     { fg = c.magenta })
        hl('Identifier',   { fg = c.blue })
        hl('Function',     { fg = c.blue })
        hl('Statement',    { fg = c.red, bold = true })
        hl('Keyword',      { fg = c.red, bold = true })
        hl('PreProc',      { fg = c.yellow })
        hl('Type',         { fg = c.yellow })
        hl('Special',      { fg = c.magenta })
        hl('Delimiter',    { fg = c.fg })
        hl('Operator',     { fg = c.red })

        hl('DiagnosticError', { fg = c.red })
        hl('DiagnosticWarn',  { fg = c.yellow })
        hl('DiagnosticInfo',  { fg = c.blue })
        hl('DiagnosticHint',  { fg = c.cyan })

        for i, color in ipairs({ c.bg, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.fg }) do
          vim.g['terminal_color_' .. (i - 1)] = color
        end
      end,
    })

    vim.cmd.colorscheme('gruvbox-material')
  end,
}
