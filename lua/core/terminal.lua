function OpenTerminal()
    local height = math.floor(vim.o.lines * 0.25)  
    vim.cmd('botright ' .. height .. 'split | terminal')
    vim.cmd('setlocal nonumber norelativenumber')
    vim.cmd('startinsert')
end

function ToggleTerminal()
    local winnr = vim.fn.winnr('$')
    if vim.fn.getwinvar(winnr, '&buftype') == 'terminal' then
        vim.cmd(winnr .. 'close')  
    else
        OpenTerminal()
    end
end


