return { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    -- The main branch is a full rewrite that does not support lazy-loading. It only installs
    -- parsers and queries; highlighting and indent are enabled per buffer in the autocmd below.
    -- Installing parsers requires the `tree-sitter` CLI (0.26.1+) and a C compiler in your path.
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
      local ts = require('nvim-treesitter')
      ts.install({ 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' })

      local available = ts.get_available()

      local function start(buf, lang)
        if not vim.api.nvim_buf_is_valid(buf) or not pcall(vim.treesitter.start, buf, lang) then
          return
        end
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to this check.
        if lang == 'ruby' then
          vim.bo[buf].syntax = 'ON'
        else
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang then
            return
          end

          if vim.treesitter.language.add(lang) then
            start(args.buf, lang)
          elseif vim.list_contains(available, lang) then
            -- Autoinstall languages that are not installed
            ts.install(lang):await(function(err)
              if not err then
                vim.schedule(function()
                  start(args.buf, lang)
                end)
              end
            end)
          end
        end,
      })

      -- There are additional treesitter plugins that you can use to interact with nvim-treesitter.
      -- You should go explore a few and see what interests you:
      --
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
}
