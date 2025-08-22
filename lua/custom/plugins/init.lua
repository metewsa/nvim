-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    ft = 'markdown',
    lazy = false,
    dependencies = 'MeanderingProgrammer/render-markdown.nvim',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = 'personal',
          path = '~/obsidian/',
        },
      },
      daily_notes = {
        folder = '/Daily',
        date_format = '%d-%m-%Y',
        default_tags = { 'diary' },
      },
      completion = {
        blink = true,
      },
    },
    keys = {
      vim.keymap.set('n', '<leader>os', '<cmd>Obsidian search<CR>', { desc = 'Search Obsidian Vault' }),
      vim.keymap.set('n', '<leader>od', '<cmd>Obsidian dailies<CR>', { desc = 'Obsidian Dailies' }),
      vim.keymap.set('n', '<leader>on', '<cmd>Obsidian new<CR>', { desc = 'Obsidian New Note' }),
      vim.keymap.set('n', '<leader>ob', '<cmd>Obsidian backlinks<CR>', { desc = 'Obsidian Backlinks' }),
      vim.keymap.set('n', '<leader>oi', '<cmd>Obsidian pasteimg<CR>', { desc = 'Paste Image' }),
      vim.keymap.set('n', '<leader>ot', '<cmd>Obsidian tags<CR>', { desc = 'Obsidian Tags' }),
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      image = {
        resolve = function(path, src)
          if require('obsidian.api').path_is_note(path) then
            return require('obsidian.api').resolve_image_path(src)
          end
        end,
      },
    },
  },
  {
    'jubnzv/mdeval.nvim',
    opts = {},
    keys = {
      vim.keymap.set('n', '<leader>or', '<cmd>MdEval<CR>', { desc = 'Execute Code Block' }),
    },
  },
  {
    'michaelb/sniprun',
    branch = 'master',

    build = 'sh install.sh',
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

    config = function()
      require('sniprun').setup {
        -- your options
      }
    end,
  },
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = { -- set to setup table
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}
