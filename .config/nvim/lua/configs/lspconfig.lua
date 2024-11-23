local configs = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local servers = {
  docker_compose_language_service = {},
  fish_lsp = {},
  graphql = {},
  jsonls = {},
  postgres_lsp = {},
  ruff = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  lspconfig[name].setup(opts)
end

-- Typescript/Javascript
-- Special setup for typescript-tools
require("typescript-tools").setup {
  on_init = configs.on_init,
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
}
