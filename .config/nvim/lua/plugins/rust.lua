return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    ft = { 'rust' },
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          enable_clippy = true,
        },
        server = {
          on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, silent = true }
            vim.keymap.set('n', 'K', '<cmd>RustLsp hover actions<cr>', opts)
            vim.keymap.set('n', '<leader>ca', '<cmd>RustLsp codeAction<cr>', opts)
            vim.keymap.set('n', '<leader>dr', '<cmd>RustLsp debuggables<cr>', opts)
          end,
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
      }
    end,
  },

  {
    'Saecki/crates.nvim',
    ft = { 'rust', 'toml' },
    config = function()
      require('crates').setup()
    end,
  },
}
