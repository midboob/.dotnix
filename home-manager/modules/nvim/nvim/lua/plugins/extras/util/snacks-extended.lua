return {
  "snacks.nvim",
  opts = {
    dashboard = {
      enabled = true,
      width = 18,
      preset = {
        header = [[
                                                                               
                  ████ ██████           █████      ██                    
                 ███████████             █████                            
                 █████████ ███████████████████ ███   ███████████  
                █████████  ███    █████████████ █████ ██████████████  
               █████████ ██████████ █████████ █████ █████ ████ █████  
             ███████████ ███    ███ █████████ █████ █████ ████ █████ 
            ██████  █████████████████████ ████ █████ █████ ████ ██████
        ]],
      },
      sections = {
        -- stylua: ignore start
        { hidden = true, key = "o", action = ":lua Snacks.dashboard.pick('files', { cwd = '/mnt/Storage/Documents/notes/' })" },
        { hidden = true, key = "l", action = ":Lazy" },
        { hidden = true, key = "q", action = ":qa" },
        { hidden = true, key = "d", action = ":lua Snacks.dashboard.pick('files', { cwd = '~/.dotfiles', hidden = true })", },
        { hidden = true, key = "f", action = ":lua Snacks.dashboard.pick('files')" },
        { hidden = true, key = "n", action = ":ene | startinsert" },
        { hidden = true, key = "c", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
        -- stylua: ignore end

        -- Header
        { text = " ", padding = 12 },
        {
          padding = 2,
          text = {
            { "Neovim :: Welcome back pɹɐʍpǝ", hl = "Title" },
          },
        },

        -- Keys
        {
          padding = 1,
          text = {
            { "  [F]ind File", width = 19, hl = "Function" },
            { "  [O]bsidian", hl = "Function" },
          },
        },
        {
          padding = 1,
          text = {
            { " ", width = 13 },
            { "  [N]ew File", hl = "Function" },
            { " ", width = 6 },
            { "󰒲  [L]azy", hl = "Function" },
            { " ", width = 17 },
          },
        },
        {
          padding = 2,
          text = {
            { " ", width = 8 },
            { "  [C]onfig", hl = "Function" },
            { " ", width = 8 },
            { "  [D]otfiles", hl = "Function" },
            { " ", width = 8 },
          },
        },

        --  Startup
        { section = "startup", padding = 1 },
        { section = "terminal", cmd = "printf ' '", height = 15 },
      },
    },

    image = {
      enabled = true,
      resolve = function(file, src)
        -- Clean link from "image\" to "image"
        local clean_src = src:match("^(.-)\\") or src

        -- List of possible image directories (across different machines or vaults)
        local image_dirs = {
          vim.fn.expand("~/Documents/notes/999 Images"), -- Path on Computer A
          vim.fn.expand("/mnt/Storage/Documents/notes/999 Images/"), -- Path on Computer B (adjust this)
        }

        -- Try each directory in order
        for _, dir in ipairs(image_dirs) do
          local full_path = vim.fn.fnamemodify(dir .. "/" .. clean_src, ":p")
          if vim.fn.filereadable(full_path) == 1 then
            return full_path
          end
        end

        -- Fallback: resolve relative to current file
        local fallback_path = vim.fn.fnamemodify(file:match("(.*/)") .. clean_src, ":p")
        return fallback_path
      end,
      doc = {
        enable = true,
        inline = true,
        float = false,
        max_width = 80,
        max_height = 40,
      },
      math = {
        enabled = true,
        typst = {
          tpl = [[
        #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
        #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
        #set text(size: 12pt, fill: rgb("${color}"))
        ${header}
        ${content}]],
        },
        latex = {
          font_size = "Large", -- see https://www.sascha-frank.com/latex-font-size.html
          -- for latex documents, the doc packages are included automatically,
          -- but you can add more packages here. Useful for markdown documents.
          packages = { "amsmath", "amssymb", "amsfonts", "amscd", "mathtools" },
          tpl = [[
        \documentclass[preview,border=0pt,varwidth,12pt]{standalone}
        \usepackage{${packages}}
        \begin{document}
        ${header}
        { \${font_size} \selectfont
          \color[HTML]{${color}}
        ${content}}
        \end{document}]],
        },
      },
    },

    explorer = { enabled = false },
    picker = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    toggle = { map = LazyVim.safe_keymap_set },
    words = { enabled = true },

    styles = {
      snacks_image = {
        relative = "editor",
        col = -1,
      },
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>n", function()
      if Snacks.config.picker and Snacks.config.picker.enabled then
        Snacks.picker.notifications()
      else
        Snacks.notifier.show_history()
      end
    end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },

    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    -- Grep
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
    { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  },
}
