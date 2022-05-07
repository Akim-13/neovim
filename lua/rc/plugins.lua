local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("ERROR: something wrong with packer")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- Basic stuff
  use "wbthomason/packer.nvim"			-- Have packer manage itself
  use "nvim-lua/popup.nvim"				-- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"			-- Useful lua functions used by lots of plugins

  -- Colourscheme
  use "ellisonleao/gruvbox.nvim"
  --use 'marko-cerovac/material.nvim'
  --use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
  --use "morhetz/gruvbox"
  --use "ellisonleao/gruvbox.nvim"
  --use "sainnhe/sonokai"
  --use 'luisiacc/gruvbox-baby'

  -- Completion
  use "hrsh7th/nvim-cmp"				-- The completion plugin
  use "hrsh7th/cmp-buffer"				-- Buffer completions
  use "hrsh7th/cmp-path"				-- Path completions
  use "hrsh7th/cmp-cmdline"				-- Cmdline completions
  use "saadparwaiz1/cmp_luasnip"		-- Snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip"				-- Snippet engine
  use "rafamadriz/friendly-snippets"	-- A bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"

  -- Autopairs
  use "windwp/nvim-autopairs"			-- Integrates with both cmp and treesitter

  -- Tree on the left
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Show colors
  use 'norcalli/nvim-colorizer.lua'

  -- Debugger
  use 'puremourning/vimspector'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
