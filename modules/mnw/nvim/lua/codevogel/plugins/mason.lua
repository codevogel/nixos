local plugin = {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
    },
    registries = {
      "github:mason-org/mason-registry",
      "github:Crashdummyy/mason-registry",
    },
  },
}

if mnw ~= nil then
  plugin.enabled = false
end

return plugin
