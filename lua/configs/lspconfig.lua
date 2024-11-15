local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

nvlsp.defaults()

local servers = {
    clangd = {
        cmd = {
            "clangd",
            "--compile-commands-dir=./",
            "--background-index",
            "--suggest-missing-includes"
        },
        root_dir = lspconfig.util.root_pattern("compile_commands.json", "build", ".cproject", ".project") or
                   lspconfig.util.find_git_root() or
                   lspconfig.util.find_node_modules_root() or
                   lspconfig.util.find_package_json_root(),
    },

    pyright = {},
    awk_ls = {},
    bashls = {},
    lua_ls = {},
}

for name, opts in pairs(servers) do
    opts.on_init = nvlsp.on_init
    opts.on_attach = nvlsp.on_attach
    opts.capabilities = nvlsp.capabilities

    lspconfig[name].setup(opts)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

