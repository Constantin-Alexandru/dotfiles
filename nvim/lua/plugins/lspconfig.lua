return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp"
    },
    config = function()
      -- CHECK FOR LSPS AND INSTALL

      local install_from_command = require "helpers.os".install_from_command

      local lua_ls_installed = install_from_command({ "sudo", "pacman", "--noconfirm", "-Syu", "lua-language-server" })
      local ltex_ls_installed = install_from_command({ "yay", "--noconfirm", "-Syu", "ltex-ls-bin" }, "ltex-ls")
      local clangd_installed = install_from_command({ "yay", "--noconfirm", "-Syu", "clang" }, "clangd")
      local cmake_ls_installed = install_from_command({ "pipx", "install", "cmake-language-server" })
      local pyright_ls_installed = install_from_command({ "pipx", "install", "pyright" })

      -- AUTOCOMPLETE SETUP

      local capabilities = require 'cmp_nvim_lsp'.default_capabilities()


      -- SETUP LSPS
      if lua_ls_installed then
        require "lspconfig".lua_ls.setup {
          capabilities = capabilities,
          on_init = function(client)
            local path = client.workspace_folders[1].name
            if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
              client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                  version = 'LuaJIT'
                },
                workspace = {
                  library = { vim.env.VIMRUNTIME }
                }
              })

              client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
            end
            return true
          end
        }
      end

      if ltex_ls_installed then
        require "lspconfig".ltex.setup {
          capabilities = capabilities,
          settings = {
            ltex = {
              language = "en-GB",
              enabled = { "bibtex", "tex", "latex", "plaintext", "text" },
              checkFrequency = "save",

            }
          },
          on_attach = function(_, bufnr)
            require("ltex-utils").on_attach(bufnr)
          end
        }
      end

      if clangd_installed then
        require "lspconfig".clangd.setup {
          capabilities = capabilities
        }
      end

      if cmake_ls_installed then
        require "lspconfig".cmake.setup {
          capabilities = capabilities
        }
      end

      if pyright_ls_installed then
        require "lspconfig".pyright.setup {
          capabilities = capabilities
        }
      end


      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local set = require "helpers.mapping".set

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local set_opts = { buffer = args.buf }

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
            set('n', "<C-s>", function() vim.lsp.buf.format() end, "Format current file")
          end
          if client.supports_method('textDocument/codeActions') then
            set({ 'n', 'v' }, "<leader>ca", vim.lsp.buf.code_action, "Open the code action menu", set_opts)
          end
          if client.supports_method('textDocument/declaration') then
            set('n', "gD", vim.lsp.buf.declaration, "Go to declaration", set_opts)
          end
          if client.supports_method('textDocument/definition') then
            set('n', "gd", "<cmd>Telescope lsp_definitions<CR>", "Go to declaration", set_opts)
          end
          if client.supports_method('textDocument/implementation') then
            set('n', "gi", "<cmd>Telescope lsp_implementations<CR>", "Go to implementation", set_opts)
          end
          if client.supports_method('textDocument/rename') then
            set('n', "<leader>rn", vim.lsp.buf.rename, "Rename variable in context", set_opts)
          end
          if client.supports_method('textDocument/references') then
            set('n', "gR", "<cmd>Telescope lsp_references<CR>", "Show references", set_opts)
          end
          if client.supports_method('textDocument/diagnostic') then
            set('n', '<leader>D', "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics", set_opts)
            set('n', '<leader>d', vim.diagnostics.open_float, "Show line diagnostics", set_opts)
            set('n', '[d', vim.diagnostics.goto_prev, "Go to previous diagnostic", set_opts)
            set('n', ']d', vim.diagnostics.goto_next, "Go to next diagnostic", set_opts)
          end


          set('n', "<leader>rs", ":LspRestart<CR>", "Restart LSP", set_opts)
        end
      })
    end
  }
}
