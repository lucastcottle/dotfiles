return {
  {
    'someone-stole-my-name/yaml-companion.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'b0o/schemastore.nvim',
    },
    ft = { 'yaml' },
    config = function()
      local cfg = require('yaml-companion').setup {
        builtin_matchers = {
          kubernetes = { enabled = true },
        },
        lspconfig = {
          settings = {
            yaml = {
              format = {
                enable = true,
              },
              validate = true,
              hover = true,
              completion = true,
              schemaStore = {
                enable = false,
                url = '',
              },
              schemas = require('schemastore').yaml.schemas(),
              schemaDownload = { enable = true },
            },
          },
        },
      }

      require('lspconfig')['yamlls'].setup(cfg)
    end,
  },
}
