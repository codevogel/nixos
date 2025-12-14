if mnw == nil then
  return {
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
end
