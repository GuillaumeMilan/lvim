-- Default plugin
lvim.builtin.cmp.completion.keyword_length = 5
lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 200
-- remove smart display which cut your path
lvim.builtin.telescope.defaults.path_display = { }

require "user.copilot"
require "user.aliases"

-- User plugings
lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "github/copilot.vim" },
}

lvim.colorscheme = "aurora"
-- lvim.transparent_window = true

-- lvim.format_on_save = true

lvim.builtin.treesitter.ensure_installed = {
  "javascript",
  "json",
  "lua",
  "typescript",
  "tsx",
  "css",
  "elixir",
  "heex",
}

lvim.lsp.installer.setup.ensure_installed = {
  "lua_ls",
  "cssls",
  "tsserver",
  "tailwindcss",
  "elixirls"
}

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tailwindcss" })
vim.opt.mouse = ""
vim.opt.clipboard = ""

local opts = {
  root_dir = function(fname)
    local util = require "lspconfig/util"
    return util.root_pattern("assets/tailwind.config.js", "tailwind.config.js", "tailwind.config.cjs", "tailwind.js",
      "tailwind.cjs")(fname)
  end,
  init_options = {
    userLanguages = { heex = "html", elixir = "html" }
  },
}
require("lvim.lsp.manager").setup("tailwindcss", opts)
