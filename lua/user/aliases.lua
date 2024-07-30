-- Unassign bindings
lvim.builtin.which_key.mappings["c"] = {
 name = "Clipboard",
 ["c"] = { "<cmd>lua if vim.opt.clipboard._value == \"unnamedplus\" then vim.opt.clipboard=\"\" else vim.opt.clipboard=\"unnamedplus\" end<CR>", "Toggle clipboard" },
}

-- Keybindings
lvim.builtin.which_key.mappings["b"]["d"] = { "<cmd>BufferKill<CR>", "Close" }
lvim.builtin.which_key.mappings["b"]["g"] = {
  name = "GoTo",
  ["1"] = { "<cmd>BufferLineGoTo 1<CR>", "1" },
  ["2"] = { "<cmd>BufferLineGoTo 2<CR>", "2" },
  ["3"] = { "<cmd>BufferLineGoTo 3<CR>", "3" },
  ["4"] = { "<cmd>BufferLineGoTo 4<CR>", "4" },
  ["5"] = { "<cmd>BufferLineGoTo 5<CR>", "5" },
  ["6"] = { "<cmd>BufferLineGoTo 6<CR>", "6" },
  ["7"] = { "<cmd>BufferLineGoTo 7<CR>", "7" },
  ["8"] = { "<cmd>BufferLineGoTo 8<CR>", "8" },
  ["9"] = { "<cmd>BufferLineGoTo 9<CR>", "9" },
  ["0"] = { "<cmd>BufferLineGoTo 10<CR>", "10" },
}

-- LSP
lvim.builtin.which_key.mappings["l"]["g"] = {
  name = "Helper",
  ["k"] = { "<cmd>lua vim.lsp.buf.hover()<cr><cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" },
  ["d"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "definition" },
  ["D"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
  ["r"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "references" },
  ["I"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
  ["s"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "show signature help" },
  ["l"] = {
    function()
      local float = vim.diagnostic.config().float

      if float then
        local config = type(float) == "table" and float or {}
        config.scope = "line"

        vim.diagnostic.open_float(config)
      end
    end,
    "Show line diagnostics",
  },
}

-- Git
lvim.builtin.which_key.mappings["g"]["b"] = { "<cmd>Gitsigns blame_line<CR>", "Blame line" }
lvim.builtin.which_key.mappings["g"]["c"] = {
  name = "Checkout",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
}

lvim.builtin.which_key.mappings["u"] = {
  name = "Utils",
  ["h"] = { '<cmd>let @/=""<CR>', "No Highlight" },
}
