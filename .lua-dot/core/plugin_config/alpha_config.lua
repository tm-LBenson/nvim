local M = {}

function M.setup()
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'
    local ignored_dirs = require'core.plugin_config.ignored_dirs'
    local function open_projects()
        require('telescope.builtin').find_files({
            search_dirs = {'~/projects/'},
            hidden = true,
            file_ignore_patterns = {'node_modules/.*', '%.next/', 'dist/', 'build/'}
       })
    end

    -- Constructing the find command with exclusions
    local find_command = {'rg', '--files', '--hidden'}
    for _, dir in pairs(ignored_dirs.ignored) do
        table.insert(find_command, '--ignore')
        table.insert(find_command, dir)
    end

    dashboard.section.header.val = {
        'Neovim',
        '',
        'Enjoy your coding journey!'
    }

    dashboard.section.buttons.val = {
        dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        
        dashboard.button("p", "  Projects", ":lua open_projects()<CR>"),

        dashboard.button("s", "  Settings", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>")
    }

    -- Set footer using an external command or static text
    local handle = io.popen('fortune')  -- Ensure 'fortune' is installed
    local fortune = handle:read("*a")
    handle:close()
    dashboard.section.footer.val = fortune

    alpha.setup(dashboard.config)
end

return M

