local mod = "SUPER"
local home = os.getenv("HOME")

---------------- MONITORS ----------------
hl.monitor({
    output   = "desc:Dell Inc. AW3225QF FGB8YZ3",
    mode     = "3840x2160@240.00",
    position = "0x0",
    scale    = "1",
})
hl.monitor({
    output    = "desc:AOC Q2790 GQMJ7HA001233",
    mode      = "2560x1440@59.95",
    position  = "3840x-200",
    scale     = "1",
    transform = 1,
})

---------------- ENVIRONMENT ----------------
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_DRM_DEVICES", "/dev/dri/card1")
hl.env("XCURSOR_THEME", "phinger-cursors-dark")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRSHOT_DIR", home .. "/Pictures/screenshots")

---------------- AUTOSTART ----------------
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & awww-daemon --format xrgb & clipse --listen & hypridle & swaync")
end)

---------------- OPTIONS ----------------
local accent = { colors = { "rgba(ffa100ff)", "rgba(ff2a00ee)" }, angle = 45 }

hl.config({
    ecosystem = {
        no_update_news  = false,
        no_donation_nag = true,
    },

    general = {
        gaps_in     = 8,
        gaps_out    = 45,
        border_size = 3,
        col = {
            active_border   = accent,
            inactive_border = "rgba(00000000)",
        },
    },

    input = {
        sensitivity  = 0.7,
        repeat_rate  = 60,
        repeat_delay = 300,
        touchpad = {
            natural_scroll       = true,
            clickfinger_behavior = true,
        },
    },

    cursor = {
        inactive_timeout  = 0.75,
        hide_on_key_press = true,
    },

    dwindle = {
        preserve_split = true,
    },

    group = {
        col = {
            border_active   = accent,
            border_inactive = "rgba(00000000)",
        },
        groupbar = {
            height        = 64,
            render_titles = false,
            rounding      = 1,
            col = {
                active   = "rgba(ffa110ff)",
                inactive = "rgba(ffa11055)",
            },
        },
    },

    decoration = {
        rounding              = 8,
        rounding_power        = 4.0,
        active_opacity        = 0.9,
        inactive_opacity      = 0.7,
        border_part_of_window = false,
        shadow = {
            enabled      = true,
            range        = 6,
            render_power = 2,
            color        = 0x44000000,
        },
        blur = {
            enabled        = true,
            size           = 12,
            ignore_opacity = true,
            passes         = 3,
            popups         = true,
            xray           = false,
        },
    },

    misc = {
        disable_hyprland_logo = true,
    },

    animations = {
        enabled = true,
    },
})

---------------- DEVICES ----------------
-- for _, name in ipairs({
--     "usb-keyboard",
--     "keychron--keychron-k8-version-2",
--     "keychron--keychron-k8-version-2-keyboard",
--     "-keychron-k8-version-2-keyboard",
-- }) do
--     hl.device({ name = name, kb_options = "altwin:swap_alt_win" })
-- end

---------------- ANIMATIONS ----------------
hl.curve("bezier1", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("bezier2", { type = "bezier", points = { { 0.0, 0.1 }, { 0.0, 1.0 } } })
hl.curve("bezier3", { type = "bezier", points = { { 0.84, 0.21 }, { 1.0, 0.67 } } })

hl.animation({ leaf = "windows",     enabled = true, speed = 3,  bezier = "bezier1" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 3,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 2,  bezier = "default" })

---------------- WINDOW RULES ----------------
hl.window_rule({
    name         = "clipse",
    match        = { class = "clipse" },
    float        = true,
    center       = true,
    size         = "600 1000",
    dim_around   = true,
    stay_focused = true,
})

hl.window_rule({
    name        = "no-border-single-tiled",
    match       = { workspace = "w[t1]" },
    border_size = 0,
})

---------------- KEYBINDS ----------------
local function key(k) return mod .. " + " .. k end
local scripts = home .. "/.config/nixos/home/hypr/scripts"

-- Apps
hl.bind(key("Return"), hl.dsp.exec_cmd("ghostty --working-directory=" .. home))
hl.bind(key("C"),      hl.dsp.exec_cmd("kitty --class clipse -e 'clipse'"))
hl.bind(key("space"),  hl.dsp.exec_cmd("tofi-drun --drun-launch=true"))

-- Window management
hl.bind(key("Q"),         hl.dsp.window.close())
hl.bind(key("V"),         hl.dsp.window.float({ action = "toggle" }))
hl.bind(key("A"),         hl.dsp.layout("togglesplit"))
hl.bind(key("S"),         hl.dsp.layout("swapsplit"))
hl.bind(key("O"),         hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }))
hl.bind(key("P"),         hl.dsp.window.pseudo())
hl.bind(key("F"),         hl.dsp.window.fullscreen())
hl.bind(key("SHIFT + F"), hl.dsp.window.fullscreen_state({ internal = 0, client = 3 }))

-- Media / brightness
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 10%+"))
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("pamixer --toggle-mute"))
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("pamixer --decrease 10"))
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("pamixer --increase 10"))

-- Scripts
hl.bind(key("SHIFT + G"), hl.dsp.exec_cmd(scripts .. "/toggle_gaps/toggle_gaps.sh"))
hl.bind(key("SHIFT + T"), hl.dsp.exec_cmd(scripts .. "/toggle_theme.sh"))

-- Screenshots
hl.bind(key("SHIFT + Print"), hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("Print",              hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(key("Print"),         hl.dsp.exec_cmd("hyprshot -m region"))

-- Focus / move (vim keys)
local dirs = { H = "left", L = "right", K = "up", J = "down" }
for k, dir in pairs(dirs) do
    hl.bind(key(k),          hl.dsp.focus({ direction = dir }))
    hl.bind(key("ALT + " .. k), hl.dsp.window.move({ direction = dir }))
end

-- Move window or group
local groupDirs = { Y = "left", O = "right", I = "up", U = "down" }
for k, dir in pairs(groupDirs) do
    hl.bind(key("ALT + " .. k), hl.dsp.window.move({ direction = dir, group_aware = true }))
end

-- Groups
hl.bind(key("CTRL + G"), hl.dsp.group.toggle())
hl.bind(key("CTRL + J"), hl.dsp.group.next())
hl.bind(key("CTRL + K"), hl.dsp.group.prev())

-- Resize (repeating, replaces binde)
hl.bind(key("SHIFT + L"), hl.dsp.window.resize({ x = 40,  y = 0,   relative = true }), { repeating = true })
hl.bind(key("SHIFT + H"), hl.dsp.window.resize({ x = -40, y = 0,   relative = true }), { repeating = true })
hl.bind(key("SHIFT + J"), hl.dsp.window.resize({ x = 0,   y = 40,  relative = true }), { repeating = true })
hl.bind(key("SHIFT + K"), hl.dsp.window.resize({ x = 0,   y = -40, relative = true }), { repeating = true })

-- Mouse move/resize (replaces bindm)
hl.bind(key("mouse:272"), hl.dsp.window.drag(),   { mouse = true })
hl.bind(key("mouse:273"), hl.dsp.window.resize(), { mouse = true })

-- Workspaces + matching wallpaper (replaces $w1..$w9)
local wallpaperScript = scripts .. "/toggle_gaps/swww.sh"
local wallpaperDir    = home .. "/.config/nixos/media/wallpapers"
local wallpapers = {
    "abstract-0.jpg",   "abstract-40.jpg",   "abstract-80.jpg",
    "abstract-120.jpg", "abstract-160.jpg",  "abstract--160.jpg",
    "abstract--120.jpg", "abstract--80.jpg", "abstract--40.jpg",
}

for i = 1, 9 do
    local setWallpaper = wallpaperScript .. " " .. wallpaperDir .. "/" .. wallpapers[i]

    hl.bind(key(tostring(i)), function()
        hl.dispatch(hl.dsp.focus({ workspace = i }))
        hl.exec_cmd(setWallpaper)
    end)

    hl.bind(key("SHIFT + " .. i), function()
        hl.dispatch(hl.dsp.window.move({ workspace = i }))
        hl.exec_cmd(setWallpaper)
    end)
end
