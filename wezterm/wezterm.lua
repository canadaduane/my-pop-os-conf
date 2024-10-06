-- vim: tabstop=2 shiftwidth=2 expandtab

local wezterm = require 'wezterm'
local appearance = require 'appearance'
local projects = require 'projects'
local config = wezterm.config_builder()
local act = wezterm.action

config.set_environment_variables = {
    PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
}

if appearance.is_dark() then
    config.color_scheme = 'Dracula'
else
    config.color_scheme = 'Tokyo Night Day'
end

config.font = wezterm.font('MesloLGS NF')
config.font_size = 16

-- Slightly transparent and blurred background
--config.window_background_opacity = 0.9
--config.macos_window_background_blur = 30

-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE'

-- Sets the font for the window frame (tab bar)
config.window_frame = {
    font = wezterm.font({ family = 'MesloLGS NF', weight = 'Bold' }),
    font_size = 14,
}

local function replace_home_dir(path)
    local home = os.getenv("HOME")
    if home and path:sub(1, #home) == home then
        path = "~" .. path:sub(#home + 1)
    end
    return path
end

local function get_cwd(pane)
    local cwd = pane:get_current_working_dir()
    local home = os.getenv("HOME")
    if cwd then
        cwd = replace_home_dir(cwd.file_path)
        return cwd
    end
    return "?"
end

local function segments_for_right_status(window, pane)
    return {
        get_cwd(pane),
        pane:get_title() or 'none',
        window:active_workspace()
    }
end

wezterm.on('update-status', function(window, pane)
    local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
    local segments = segments_for_right_status(window, pane)

    local color_scheme = window:effective_config().resolved_palette
    -- Note the use of wezterm.color.parse here, this returns
    -- a Color object, which comes with functionality for lightening
    -- or darkening the colour (amongst other things).
    local bg = wezterm.color.parse(color_scheme.background)
    local fg = color_scheme.foreground

    -- Each powerline segment is going to be coloured progressively
    -- darker/lighter depending on whether we're on a dark/light colour
    -- scheme. Let's establish the "from" and "to" bounds of our gradient.
    local gradient_to, gradient_from = bg, bg
    if appearance.is_dark() then
        gradient_from = gradient_to:lighten(0.2)
    else
        gradient_from = gradient_to:darken(0.2)
    end

    -- Yes, WezTerm supports creating gradients, because why not?! Although
    -- they'd usually be used for setting high fidelity gradients on your terminal's
    -- background, we'll use them here to give us a sample of the powerline segment
    -- colours we need.
    local gradient = wezterm.color.gradient(
        {
            orientation = 'Horizontal',
            colors = { gradient_from, gradient_to },
        },
        #segments -- only gives us as many colours as we have segments.
    )

    -- We'll build up the elements to send to wezterm.format in this table.
    local elements = {}

    for i, seg in ipairs(segments) do
        local is_first = i == 1

        if is_first then
            table.insert(elements, { Background = { Color = 'none' } })
        end
        table.insert(elements, { Foreground = { Color = gradient[i] } })
        table.insert(elements, { Text = SOLID_LEFT_ARROW })

        table.insert(elements, { Foreground = { Color = fg } })
        table.insert(elements, { Background = { Color = gradient[i] } })
        table.insert(elements, { Text = ' ' .. seg .. ' ' })
    end

    window:set_right_status(wezterm.format(elements))
end)

-- If you're using emacs you probably wanna choose a different leader here,
-- since we're gonna be making it a bit harder to CTRL + A for jumping to
-- the start of a line
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(-1),
  },
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(1),
  },
}


-- Table mapping keypresses to actions
config.keys = {
    -- Sends ESC + b and ESC + f sequence, which is used
    -- for telling your shell to jump back/forward.
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = act.SendString '\x1bb', -- ESC + B
    },

    {
        key = 'RightArrow',
        mods = 'OPT',
        action = act.SendString '\x1bf', -- ESC + F
    },

    {
        key = ',',
        mods = 'CTRL',
        action = act.SpawnCommandInNewTab {
            cwd = wezterm.home_dir,
            args = { 'nvim', wezterm.config_file },
        },
    },

    {
        key = 'a',
        -- When we're in leader mode _and_ CTRL + A is pressed...
        mods = 'LEADER|CTRL',
        -- Actually send CTRL + A key to the terminal
        action = act.SendKey { key = 'a', mods = 'CTRL' },
    },

    {
        key = 'p',
        mods = 'LEADER',
        -- Present in to our project picker
        action = projects.choose_project(),
    },

    {
        key = 'f',
        mods = 'LEADER',
        -- Present a list of existing workspaces
        action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
    },

    {
        key = 'LeftArrow',
        mods = 'CMD|ALT',
        action = wezterm.action {
            ActivateTabRelative = -1,
        },
    },

    {
        key = 'RightArrow',
        mods = 'CMD|ALT',
        action = wezterm.action {
            ActivateTabRelative = 1,
        },
    },

    { key = 'PageUp', action = act.ScrollByPage(-1) },
    { key = 'PageDown', action = act.ScrollByPage(1) },


    {
        key = 'r',
        mods = 'CTRL|OPT',
        action = act.SendKey { key = 'r', mods = 'CTRL' },
    },

    {
        key = 'w',
        mods = 'CTRL',
        action = act.CloseCurrentPane { confirm = true },
    },

    {
        key = 't',
        mods = 'CTRL',
        action = act.SpawnTab "CurrentPaneDomain",
    },

    {
        key = 'Escape',
        action = wezterm.action_callback(function(window, pane)
            selection_text = window:get_selection_text_for_pane(pane)
            is_selection_active = string.len(selection_text) ~= 0
            if is_selection_active then
                window:perform_action(act.ClearSelection, pane)
            else
                window:perform_action(act.SendKey{ key = 'Escape' }, pane)
            end
        end),
    },

    {
        key = 'c',
        mods = 'CTRL',
        action = wezterm.action_callback(function(window, pane)
          local has_selection = window:get_selection_text_for_pane(pane) ~= ''
          if has_selection then
            window:perform_action(act.CopyTo 'Clipboard', pane)
            window:perform_action(act.ClearSelection, pane)
          else
            window:perform_action(act.SendKey { key = 'c', mods = 'CTRL' }, pane)
          end
        end),
    },

    {
        key = 'v',
        mods = 'CTRL',
        action = act.PasteFrom 'Clipboard'
    },

    -- Clears the scrollback and viewport, and then sends CTRL-L
    -- to ask the shell to redraw its prompt
    {
        key = 'k',
        mods = 'CTRL',
        action = act.Multiple {
          act.ClearScrollback 'ScrollbackAndViewport',
          act.SendKey { key = 'L', mods = 'CTRL' },
        },
    },
}

for i = 1, 8 do
  -- CTRL + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1),
  })
end

return config
