-- LSP Plugins

local lazydev = {
  -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      -- Load luvit types when the `vim.uv` word is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}

local useMason = mnw == nil

local lspconfig_masonDependencies = {
  -- Automatically install LSPs and related tools to stdpath for Neovim
  -- Mason must be loaded before its dependents so we need to set it up here.
  -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
  {
    "mason-org/mason.nvim",
    ---@module 'mason.settings'
    ---@type MasonSettings
    ---@diagnostic disable-next-line: missing-fields
    opts = {},
  },
  "mason-org/mason-lspconfig.nvim",
  "WhoIsSethDaniel/mason-tool-installer.nvim",
}

local lspconfig = {
  -- Main LSP Configuration
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Useful status updates for LSP.
    { "j-hui/fidget.nvim", opts = {} },

    -- Allows extra capabilities provided by blink.cmp
    "saghen/blink.cmp",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map("<leader>cr", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("<leader>ca", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
            end,
          })
        end
      end,
    })

    --- Create a table for all LSP servers
    ---@class LspServersConfig
    ---@field mason table<string, vim.lsp.Config>
    ---@field nix table<string, vim.lsp.Config>
    local servers = {
      mason = {},
      nix = {},
    }

    -- This table holds servers that need to be installed both on
    -- Nix systems and Non-nix systems
    local masonAndNixServers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      svelte = {
        capabilities = { workspace = { didChangeWatchedFiles = false } },
        settings = {
          lint = { unknownAtRules = "ignore" },
          typescript = { enable = true, preferences = { importModuleSpecifier = "non-relative" } },
          javascript = { enable = true, preferences = { importModuleSpecifier = "non-relative" } },
        },
      },
    }

    -- Holds servers that should only be available on Non-nix systems
    local masonServers = {}
    -- Holds servers that should only be available on Nix systems
    local nixServers = {}

    vim.tbl_extend("force", masonServers, masonAndNixServers)
    vim.tbl_extend("force", nixServers, masonAndNixServers)

    if useMason then
      vim.tbl_extend("keep", servers.mason, masonServers)
      for server, config in pairs(servers.mason) do
        if not vim.tbl_isempty(config) then
          vim.lsp.config[server] = config
        end
      end

      -- Tell mason to enable all servers that are installed through it
      require("mason-lspconfig").setup({
        automatic_enable = true, -- automatically run vim.lsp.enable() for all servers that are installed via Mason
      })
    else
      vim.tbl_extend("keep", servers.nix, nixServers)
      for server, config in pairs(servers.nix) do
        if not vim.tbl_isempty(config) then
          vim.lsp.config[server] = config
        end
      end

      -- Manually enable servers that are installed manually
      if not vim.tbl_isempty(servers.nix) then
        vim.lsp.enable(vim.tbl_keys(servers.nix))
      end
    end
  end,
}

local config = {}

if useMason then
  vim.tbl_extend("force", lspconfig.dependencies, lspconfig_masonDependencies)
end

table.insert(config, lazydev)
table.insert(config, lspconfig)

return config
-- vim: ts=2 sts=2 sw=2 et
