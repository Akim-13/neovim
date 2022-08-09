local status_ok, pretty_fold_preview = pcall(require, "fold-preview")
if not status_ok then
    return
end

local setup = {
    default_keybindings = true, -- Set to false to disable default keybindings

    -- 'none', "single", "double", "rounded", "solid", 'shadow' or table
    -- For explanation see: :help nvim_open_win()
    border = "shadow",
}

pretty_fold_preview.setup(setup)
